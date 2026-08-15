#define MOD_PART_HEAD		1
#define MOD_PART_CHEST		2
#define MOD_PART_GLOVES		3
#define MOD_PART_FEET		4
// #define MOD_PART_CORE		5
#define MOD_PART_CELL 		5

#define MOD_STATE_RETRACTED  1
#define MOD_STATE_DEPLOYING  2
#define MOD_STATE_DEPLOYED   3
#define MOD_STATE_RETRACTING 4

#define MOD_HELMET mod_parts[MOD_PART_HEAD]
#define MOD_CHESTPLATE mod_parts[MOD_PART_CHEST]
#define MOD_GLOVES mod_parts[MOD_PART_GLOVES]
#define MOD_BOOTS mod_parts[MOD_PART_FEET]
// #define MOD_CORE   mod_parts[MOD_PART_CORE]
#define MOD_CELL mod_parts[MOD_PART_CELL]

#define MOD_ACTIVE      (1<<0)
#define MOD_ACTIVATING  (1<<1)
#define MOD_MALFUNCTION (1<<2)
#define MOD_OPEN        (1<<3)
