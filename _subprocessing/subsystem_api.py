#!/usr/bin/env python3
"""
Subsystem Backend API - FastAPI

Receives fire events from BYOND and tracks subsystem performance.
Handles scientific notation and empty string parameters from BYOND's world.Export()
"""

from fastapi import FastAPI, Query
from fastapi.responses import HTMLResponse
from pydantic import BaseModel, Field, validator
from typing import List, Dict, Optional, Any
import logging
from datetime import datetime
from collections import defaultdict

# Configure logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Initialize FastAPI
app = FastAPI(
    title="Subsystem Backend API",
    version="2.1.0",
    description="Performance monitoring for BYOND subsystems"
)

# ============================================================
# SCIENTIFIC NOTATION PARSER
# ============================================================

def parse_numeric(value: Any) -> int:
    """
    Parses any numeric value including scientific notation.
    
    Examples:
        5.13192e+07 → 51319200
        "5.13192e+07" → 51319200
        "12345" → 12345
        12345 → 12345
        "" → 0
        None → 0
    """
    if value is None or value == "":
        return 0
    
    if isinstance(value, (int, float)):
        return int(value)
    
    if isinstance(value, str):
        value = value.strip()
        if not value:
            return 0
        
        try:
            # Python natively handles scientific notation via float()
            result = int(float(value))
            logger.debug(f"parse_numeric: '{value}' → {result}")
            return result
        except (ValueError, TypeError) as e:
            logger.error(f"Could not parse numeric value: {value}, error: {e}")
            return 0
    
    return 0


def parse_float(value: Any) -> float:
    """
    Parses any numeric value to float including scientific notation.
    Handles BYOND's malformed scientific notation (e.g., '5.20793e 07' with space).
    
    DEBUG: Logs all conversions
    """
    if value is None or value == "":
        logger.debug(f"parse_float: None/empty → 0.0")
        return 0.0
    
    if isinstance(value, (int, float)):
        result = float(value)
        logger.debug(f"parse_float: numeric {value} → {result}")
        return result
    
    if isinstance(value, str):
        value_stripped = value.strip()
        if not value_stripped:
            logger.debug(f"parse_float: empty string → 0.0")
            return 0.0
        
        try:
            value_normalized = value_stripped.replace('e ', 'e+').replace('e+', 'e+').replace('e-+', 'e-')
            
            result = float(value_normalized)
            logger.info(f"parse_float SUCCESS: '{value}' → {result}")
            return result
        except (ValueError, TypeError) as e:
            logger.error(f"parse_float FAILED: '{value}', error: {e}")
            return 0.0
    
    logger.warning(f"parse_float: unexpected type {type(value)}")
    return 0.0


# ============================================================
# MODELS
# ============================================================

class FireStartPayload(BaseModel):
    subsystem: str
    fire_number: int
    count: int = 0
    copy_time_ms: int = 0
    world_time: float = 0.0
    
    @validator('fire_number', 'count', 'copy_time_ms', pre=True)
    def parse_numbers(cls, v):
        return parse_numeric(v)
    
    @validator('world_time', pre=True)
    def parse_float_val(cls, v):
        return parse_float(v)


class FireEndPayload(BaseModel):
    subsystem: str
    fire_number: int
    total_processed: int = 0
    total_time_ms: float = 0.0
    
    @validator('fire_number', 'total_processed', pre=True)
    def parse_int_numbers(cls, v):
        return parse_numeric(v)
    
    @validator('total_time_ms', pre=True)
    def parse_float_val(cls, v):
        logger.info(f"FireEndPayload.total_time_ms validator called with: {v}")
        result = parse_float(v)
        logger.info(f"FireEndPayload.total_time_ms validator result: {result}")
        return result


class FirePausePayload(BaseModel):
    subsystem: str
    fire_number: int
    processed_count: int = 0
    remaining_count: int = 0
    total_time_ms: float = 0.0
    
    @validator('fire_number', 'processed_count', 'remaining_count', pre=True)
    def parse_int_numbers(cls, v):
        return parse_numeric(v)
    
    @validator('total_time_ms', pre=True)
    def parse_float_val(cls, v):
        logger.info(f"FirePausePayload.total_time_ms validator called with: {v}")
        result = parse_float(v)
        logger.info(f"FirePausePayload.total_time_ms validator result: {result}")
        return result


# ============================================================
# SUBSYSTEM PROCESSOR
# ============================================================

class SubsystemProcessor:
    """Tracks statistics for a single subsystem"""
    
    def __init__(self, name: str):
        self.name = name
        self.stats = {
            'total_fires': 0,
            'total_objects': 0,
            'total_time': 0.0,
            'max_time': 0.0,
            'min_time': float('inf'),
            'pauses': 0,
            'avg_time_per_fire': 0.0,
        }
        self.current_fire = {}
        self.fire_history = []
    
    def handle_fire_start(self, payload: FireStartPayload):
        """Handle fire start event"""
        self.current_fire = {
            'fire_number': payload.fire_number,
            'start_time': datetime.now().isoformat(),
            'count': payload.count,
            'copy_time_ms': payload.copy_time_ms,
            'world_time': payload.world_time,
            'pauses': 0,
        }
        logger.info(
            f"[{self.name}] FIRE_START #{payload.fire_number}: "
            f"{payload.count} objects (copy_time={payload.copy_time_ms}ms)"
        )
    
    def handle_fire_end(self, payload: FireEndPayload):
        """Handle fire end event"""
        if not self.current_fire:
            logger.warning(f"[{self.name}] FIRE_END without FIRE_START!")
            return
        
        self.current_fire['total_time'] = payload.total_time_ms
        self.current_fire['total_processed'] = payload.total_processed
        self.current_fire['end_time'] = datetime.now().isoformat()
        
        # Update statistics
        self.stats['total_fires'] += 1
        self.stats['total_objects'] = max(
            self.stats['total_objects'],
            payload.total_processed
        )
        self.stats['total_time'] += payload.total_time_ms
        
        if payload.total_time_ms > 0:
            if self.stats['min_time'] == float('inf') or payload.total_time_ms < self.stats['min_time']:
                self.stats['min_time'] = payload.total_time_ms
            self.stats['max_time'] = max(
                self.stats['max_time'],
                payload.total_time_ms
            )
        
        if self.stats['total_fires'] > 0:
            self.stats['avg_time_per_fire'] = (
                self.stats['total_time'] / self.stats['total_fires']
            )
        
        # Keep fire history (last 100)
        self.fire_history.append(self.current_fire.copy())
        if len(self.fire_history) > 100:
            self.fire_history.pop(0)
        
        logger.info(
            f"[{self.name}] FIRE_END #{payload.fire_number}: "
            f"processed={payload.total_processed}, time={payload.total_time_ms:.2f}ms, "
            f"avg={self.stats['avg_time_per_fire']:.2f}ms"
        )
    
    def handle_fire_pause(self, payload: FirePausePayload):
        """Handle fire pause event (MC_TICK_CHECK)"""
        if self.current_fire:
            self.current_fire['pauses'] = self.current_fire.get('pauses', 0) + 1
            self.current_fire['last_pause'] = datetime.now().isoformat()
            self.current_fire['last_pause_processed'] = payload.processed_count
            self.current_fire['last_pause_remaining'] = payload.remaining_count
            self.current_fire['last_pause_time_ms'] = payload.total_time_ms
            self.stats['pauses'] += 1
            
            logger.warning(
                f"[{self.name}] MC_TICK_CHECK PAUSE #{payload.fire_number}: "
                f"processed={payload.processed_count}, "
                f"remaining={payload.remaining_count}, "
                f"time_so_far={payload.total_time_ms:.2f}ms"
            )
    
    def get_stats(self) -> Dict[str, Any]:
        """Get current statistics"""
        # Convert inf to 0 for JSON serialization
        min_time = (
            0 if self.stats['min_time'] == float('inf')
            else self.stats['min_time']
        )
        
        return {
            'subsystem': self.name,
            'stats': {
                'total_fires': self.stats['total_fires'],
                'total_objects': self.stats['total_objects'],
                'total_time': round(self.stats['total_time'], 2),
                'max_time': round(self.stats['max_time'], 2),
                'min_time': round(min_time, 2),
                'pauses': self.stats['pauses'],
                'avg_time_per_fire': round(self.stats['avg_time_per_fire'], 2),
            },
            'current_fire': self.current_fire,
            'fire_history_count': len(self.fire_history),
        }


# Initialize processors
machines_processor = SubsystemProcessor('machines')
mobs_processor = SubsystemProcessor('mobs')
npcpool_processor = SubsystemProcessor('npcpool')

# ============================================================
# ROUTES
# ============================================================

@app.get("/health")
async def health():
    """Health check endpoint"""
    return {
        "status": "ok",
        "message": "Subsystem API is running",
        "timestamp": datetime.now().isoformat()
    }


@app.get("/fire/start")
async def fire_start(
    subsystem: str = Query(...),
    fire_number: str = Query(...),
    count: str = Query("0"),
    copy_time_ms: str = Query("0"),
    world_time: str = Query("0")
):
    """Handle fire start event"""
    try:
        logger.info(f"fire_start called: subsystem={subsystem}, fire_number={fire_number}, count={count}")
        
        payload = FireStartPayload(
            subsystem=subsystem,
            fire_number=fire_number,
            count=count,
            copy_time_ms=copy_time_ms,
            world_time=world_time
        )
        
        if payload.subsystem == "machines":
            machines_processor.handle_fire_start(payload)
        elif payload.subsystem == "mobs":
            mobs_processor.handle_fire_start(payload)
        elif payload.subsystem == "npcpool":
            npcpool_processor.handle_fire_start(payload)
        
        return {
            "status": "ok",
            "subsystem": payload.subsystem,
            "fire_number": payload.fire_number
        }
    
    except Exception as e:
        logger.error(f"Error in /fire/start: {e}", exc_info=True)
        return {
            "status": "error",
            "message": str(e)
        }, 400


@app.get("/fire/end")
async def fire_end(
    subsystem: str = Query(...),
    fire_number: str = Query(...),
    total_processed: str = Query("0"),
    total_time_ms: str = Query("0")
):
    """Handle fire end event"""
    try:
        logger.info(f"fire_end called: subsystem={subsystem}, fire_number={fire_number}, total_time_ms={total_time_ms}")
        
        payload = FireEndPayload(
            subsystem=subsystem,
            fire_number=fire_number,
            total_processed=total_processed,
            total_time_ms=total_time_ms
        )
        
        logger.info(f"fire_end payload created: total_time_ms={payload.total_time_ms}")
        
        if payload.subsystem == "machines":
            machines_processor.handle_fire_end(payload)
        elif payload.subsystem == "mobs":
            mobs_processor.handle_fire_end(payload)
        elif payload.subsystem == "npcpool":
            npcpool_processor.handle_fire_end(payload)
        
        return {
            "status": "ok",
            "subsystem": payload.subsystem,
            "fire_number": payload.fire_number,
            "total_processed": payload.total_processed,
            "total_time_ms": payload.total_time_ms
        }
    
    except Exception as e:
        logger.error(f"Error in /fire/end: {e}", exc_info=True)
        return {
            "status": "error",
            "message": str(e)
        }, 400


@app.get("/fire/pause")
async def fire_pause(
    subsystem: str = Query(...),
    fire_number: str = Query(...),
    processed_count: str = Query("0"),
    remaining_count: str = Query("0"),
    total_time_ms: str = Query("0")
):
    """Handle fire pause event (MC_TICK_CHECK)"""
    try:
        logger.info(f"fire_pause called: subsystem={subsystem}, fire_number={fire_number}, total_time_ms={total_time_ms}")
        
        payload = FirePausePayload(
            subsystem=subsystem,
            fire_number=fire_number,
            processed_count=processed_count,
            remaining_count=remaining_count,
            total_time_ms=total_time_ms
        )
        
        logger.info(f"fire_pause payload created: total_time_ms={payload.total_time_ms}")
        
        if payload.subsystem == "machines":
            machines_processor.handle_fire_pause(payload)
        elif payload.subsystem == "mobs":
            mobs_processor.handle_fire_pause(payload)
        elif payload.subsystem == "npcpool":
            npcpool_processor.handle_fire_pause(payload)
        
        return {
            "status": "ok",
            "subsystem": payload.subsystem,
            "fire_number": payload.fire_number,
            "processed_count": payload.processed_count,
            "remaining_count": payload.remaining_count,
            "total_time_ms": payload.total_time_ms
        }
    
    except Exception as e:
        logger.error(f"Error in /fire/pause: {e}", exc_info=True)
        return {
            "status": "error",
            "message": str(e)
        }, 400


@app.get("/stats")
async def get_stats():
    """Get statistics for all subsystems"""
    return {
        "machines": machines_processor.get_stats(),
        "mobs": mobs_processor.get_stats(),
        "npcpool": npcpool_processor.get_stats(),
        "timestamp": datetime.now().isoformat()
    }


@app.get("/stats/{subsystem}")
async def get_subsystem_stats(subsystem: str):
    """Get statistics for a specific subsystem"""
    if subsystem == "machines":
        return machines_processor.get_stats()
    elif subsystem == "mobs":
        return mobs_processor.get_stats()
    elif subsystem == "npcpool":
        return npcpool_processor.get_stats()
    else:
        return {
            "error": f"Unknown subsystem: {subsystem}",
            "available": ["machines", "mobs", "npcpool"]
        }, 404


# ============================================================
# HTML DASHBOARD
# ============================================================

def get_dashboard_html() -> str:
    """Generate HTML dashboard with auto-refresh and charts"""
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Subsystem Performance Dashboard</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.js"></script>
        <style>
              * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                background: linear-gradient(135deg, #0f2027 0%, #203a43 50%, #2c5364 100%);
                min-height: 100vh;
                padding: 20px;
            }

            .container {
                max-width: 1600px;
                margin: 0 auto;
            }

            .header {
                background: linear-gradient(135deg, rgba(255,255,255,0.98) 0%, rgba(245,245,255,0.98) 100%);
                padding: 35px;
                border-radius: 15px;
                box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
                margin-bottom: 30px;
                border-left: 5px solid #667eea;
            }

            .header h1 {
                color: #1a1a2e;
                font-size: 36px;
                margin-bottom: 5px;
                font-weight: 700;
            }

            .header p {
                color: #666;
                font-size: 15px;
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
                gap: 25px;
                margin-bottom: 30px;
            }

            .stat-card {
                background: linear-gradient(135deg, #ffffff 0%, #f8f9ff 100%);
                padding: 28px;
                border-radius: 12px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                border: 1px solid rgba(102, 126, 234, 0.1);
            }

            .stat-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 20px 60px rgba(102, 126, 234, 0.3);
            }

            .stat-card h3 {
                margin-top: 0;
                margin-bottom: 20px;
                color: #1a1a2e;
                font-size: 22px;
                display: flex;
                align-items: center;
                gap: 12px;
                font-weight: 600;
                padding-bottom: 15px;
                border-bottom: 2px solid #e0e7ff;
            }

            .stat-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 14px 0;
                border-bottom: 1px solid #f0f0f5;
            }

            .stat-row:last-child {
                border-bottom: none;
            }

            .stat-label {
                color: #5a6c7d;
                font-size: 14px;
                font-weight: 500;
            }

            .stat-value {
                font-size: 19px;
                font-weight: 700;
                color: #667eea;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .stat-value.warning {
                color: #f59e0b;
            }

            .stat-value.error {
                color: #ef4444;
            }

            .stat-value.success {
                color: #10b981;
            }

            .chart-section {
                background: linear-gradient(135deg, #ffffff 0%, #f8f9ff 100%);
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
                margin-bottom: 30px;
                border: 1px solid rgba(102, 126, 234, 0.1);
            }

            .chart-section h2 {
                color: #1a1a2e;
                margin-bottom: 25px;
                font-size: 24px;
                font-weight: 700;
                padding-bottom: 15px;
                border-bottom: 2px solid #e0e7ff;
            }

            .charts-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
                gap: 25px;
            }

            .chart-container {
                position: relative;
                height: 350px;
                background: white;
                border-radius: 10px;
                padding: 15px;
                border: 1px solid rgba(102, 126, 234, 0.08);
            }

            .total-stats {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                padding: 35px;
                border-radius: 12px;
                box-shadow: 0 15px 50px rgba(102, 126, 234, 0.3);
                margin-bottom: 30px;
                color: white;
            }

            .total-stats h2 {
                color: white;
                margin-bottom: 25px;
                font-size: 26px;
                font-weight: 700;
                padding-bottom: 15px;
                border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            }

            .total-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 20px;
            }

            .total-item {
                text-align: center;
                padding: 25px;
                background: rgba(255, 255, 255, 0.12);
                border-radius: 10px;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                transition: all 0.3s ease;
            }

            .total-item:hover {
                background: rgba(255, 255, 255, 0.18);
                transform: translateY(-3px);
            }

            .total-item .value {
                font-size: 38px;
                font-weight: 800;
                margin-bottom: 10px;
                text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .total-item .label {
                color: rgba(255, 255, 255, 0.9);
                font-size: 14px;
                font-weight: 600;
            }

            .links {
                display: flex;
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .links a {
                padding: 14px 28px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                text-decoration: none;
                border-radius: 8px;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
                border: none;
                cursor: pointer;
            }

            .links a:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 40px rgba(102, 126, 234, 0.6);
            }

            .emoji {
                font-size: 26px;
            }

            .refresh-status {
                display: inline-block;
                margin-left: 20px;
                font-size: 14px;
                color: #666;
                font-weight: 600;
            }

            .refresh-status.updating {
                color: #667eea;
                animation: pulse 1s infinite;
            }

            @keyframes pulse {
                0%, 100% { opacity: 1; }
                50% { opacity: 0.6; }
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1><span class="emoji">📊</span> Subsystem Performance Dashboard</h1>
                <p>Real-time monitoring of BYOND subsystems 
                   <span class="refresh-status" id="refresh-status">Last updated: --:--:--</span>
                </p>
            </div>
            
            <div class="stats-grid" id="stats-grid">
                <div class="stat-card" id="machines-card">
                    <h3><span class="emoji">🔧</span> Machines</h3>
                </div>
                
                <div class="stat-card" id="mobs-card">
                    <h3><span class="emoji">👥</span> Mobs</h3>
                </div>
                
                <div class="stat-card" id="npcpool-card">
                    <h3><span class="emoji">🤖</span> NPC Pool</h3>
                </div>
            </div>
            
            <div class="chart-section">
                <h2><span class="emoji">📈</span> Performance Comparison</h2>
                <div class="charts-grid">
                    <div class="chart-container">
                        <canvas id="avgTimeChart"></canvas>
                    </div>
                    <div class="chart-container">
                        <canvas id="firesChart"></canvas>
                    </div>
                </div>
            </div>
            
            <div class="chart-section">
                <h2><span class="emoji">⏱️</span> Time Distribution</h2>
                <div class="charts-grid">
                    <div class="chart-container">
                        <canvas id="totalTimeChart"></canvas>
                    </div>
                    <div class="chart-container">
                        <canvas id="pausesChart"></canvas>
                    </div>
                </div>
            </div>
            
            <div class="total-stats">
                <h2><span class="emoji">✨</span> Overall Statistics</h2>
                <div class="total-grid" id="total-grid">
                    <div class="total-item" id="total-fires">
                        <div class="value">0</div>
                        <div class="label">Total Fires</div>
                    </div>
                    <div class="total-item" id="total-objects">
                        <div class="value">0</div>
                        <div class="label">Total Objects</div>
                    </div>
                    <div class="total-item" id="total-time">
                        <div class="value">0ms</div>
                        <div class="label">Total Time</div>
                    </div>
                    <div class="total-item" id="total-pauses">
                        <div class="value">0</div>
                        <div class="label">Total Pauses</div>
                    </div>
                </div>
            </div>
            
            <div class="links">
                <a href="/docs">📚 API Documentation</a>
                <a href="/redoc">📖 ReDoc</a>
                <a href="/stats">📊 Raw JSON</a>
            </div>
        </div>
        
        <script>
        const REFRESH_INTERVAL = 500;
        let charts = {};
        
        const colors = {
            machines: { bg: 'rgba(102, 126, 234, 0.2)', border: 'rgb(102, 126, 234)' },
            mobs: { bg: 'rgba(118, 75, 162, 0.2)', border: 'rgb(118, 75, 162)' },
            npcpool: { bg: 'rgba(237, 100, 166, 0.2)', border: 'rgb(237, 100, 166)' }
        };
        
        function formatNumber(num) {
            return Math.round(num).toLocaleString();
        }
        
        function createStatRow(label, value, className = '') {
            const row = document.createElement('div');
            row.className = 'stat-row';
            row.innerHTML = `
                <span class="stat-label">${label}</span>
                <span class="stat-value ${className}">${value}</span>
            `;
            return row;
        }
        
        function updateCard(cardId, subsystemName, stats) {
            const card = document.getElementById(cardId);
            while (card.children.length > 1) {
                card.removeChild(card.children[1]);
            }
            card.appendChild(createStatRow('Total Fires', formatNumber(stats.total_fires)));
            card.appendChild(createStatRow('Objects', formatNumber(stats.total_objects)));
            card.appendChild(createStatRow('Total Time', formatNumber(stats.total_time) + 'ms'));
            card.appendChild(createStatRow('Pauses', formatNumber(stats.pauses), 'warning'));
            card.appendChild(createStatRow('Avg Time/Fire', stats.avg_time_per_fire.toFixed(2) + 'ms', 'success'));
            card.appendChild(createStatRow('Max Time', stats.max_time.toFixed(2) + 'ms'));
        }
        
        function initCharts() {
            const chartConfig = {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { labels: { font: { size: 12, weight: '600' }, color: '#5a6c7d' } }
                },
                scales: {
                    y: { beginAtZero: true, ticks: { color: '#5a6c7d' }, grid: { color: 'rgba(0,0,0,0.05)' } },
                    x: { ticks: { color: '#5a6c7d' }, grid: { color: 'rgba(0,0,0,0.05)' } }
                }
            };
            
            charts.avgTime = new Chart(document.getElementById('avgTimeChart'), {
                type: 'bar',
                data: { labels: ['Machines', 'Mobs', 'NPC Pool'], datasets: [{ label: 'Avg Time (ms)', data: [0,0,0], borderRadius: 6, ...colors.machines }]},
                options: chartConfig
            });
            
            charts.fires = new Chart(document.getElementById('firesChart'), {
                type: 'bar',
                data: { labels: ['Machines', 'Mobs', 'NPC Pool'], datasets: [{ label: 'Total Fires', data: [0,0,0], borderRadius: 6, ...colors.mobs }]},
                options: chartConfig
            });
            
            charts.totalTime = new Chart(document.getElementById('totalTimeChart'), {
                type: 'doughnut',
                data: { labels: ['Machines', 'Mobs', 'NPC Pool'], datasets: [{ data: [0,0,0], backgroundColor: ['rgb(102, 126, 234)', 'rgb(118, 75, 162)', 'rgb(237, 100, 166)'] }]},
                options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { labels: { font: { size: 12, weight: '600' }, color: '#5a6c7d' } } } }
            });
            
            charts.pauses = new Chart(document.getElementById('pausesChart'), {
                type: 'radar',
                data: { labels: ['Machines', 'Mobs', 'NPC Pool'], datasets: [{ label: 'Pauses', data: [0,0,0], borderColor: 'rgb(237, 100, 166)', backgroundColor: 'rgba(237, 100, 166, 0.2)' }]},
                options: { responsive: true, maintainAspectRatio: false, scales: { r: { ticks: { color: '#5a6c7d' }, grid: { color: 'rgba(0,0,0,0.05)' } } }, plugins: { legend: { labels: { font: { size: 12, weight: '600' }, color: '#5a6c7d' } } } }
            });
        }
        
        async function updateStats() {
            try {
                const status = document.getElementById('refresh-status');
                status.textContent = 'Updating...';
                status.classList.add('updating');
                
                const response = await fetch('/stats');
                const data = await response.json();
                
                updateCard('machines-card', 'Machines', data.machines.stats);
                updateCard('mobs-card', 'Mobs', data.mobs.stats);
                updateCard('npcpool-card', 'NPC Pool', data.npcpool.stats);
                
                const m = data.machines.stats, mo = data.mobs.stats, n = data.npcpool.stats;
                
                document.getElementById('total-fires').querySelector('.value').textContent = formatNumber(m.total_fires + mo.total_fires + n.total_fires);
                document.getElementById('total-objects').querySelector('.value').textContent = formatNumber(m.total_objects + mo.total_objects + n.total_objects);
                document.getElementById('total-time').querySelector('.value').textContent = formatNumber(m.total_time + mo.total_time + n.total_time) + 'ms';
                document.getElementById('total-pauses').querySelector('.value').textContent = formatNumber(m.pauses + mo.pauses + n.pauses);
                
                charts.avgTime.data.datasets[0].data = [m.avg_time_per_fire, mo.avg_time_per_fire, n.avg_time_per_fire];
                charts.avgTime.update();
                charts.fires.data.datasets[0].data = [m.total_fires, mo.total_fires, n.total_fires];
                charts.fires.update();
                charts.totalTime.data.datasets[0].data = [m.total_time, mo.total_time, n.total_time];
                charts.totalTime.update();
                charts.pauses.data.datasets[0].data = [m.pauses, mo.pauses, n.pauses];
                charts.pauses.update();
                
                const now = new Date();
                status.textContent = `Last updated: ${now.toLocaleTimeString()}`;
                status.classList.remove('updating');
            } catch (error) {
                console.error('Error updating stats:', error);
                document.getElementById('refresh-status').textContent = 'Update failed - retrying...';
            }
        }
        
        window.addEventListener('load', () => {
            initCharts();
            updateStats();
            setInterval(updateStats, REFRESH_INTERVAL);
        });
        </script>
    </body>
    </html>
    """


@app.get("/", response_class=HTMLResponse)
async def dashboard():
    """Display dashboard"""
    return get_dashboard_html()


# ============================================================
# MAIN
# ============================================================

if __name__ == "__main__":
    import uvicorn
    logger.info("Starting Subsystem Backend API on http://127.0.0.1:8000")
    logger.info("Dashboard available at http://127.0.0.1:8000/")
    logger.info("API Docs available at http://127.0.0.1:8000/docs")
    uvicorn.run(app, host="127.0.0.1", port=8000, log_level="info")