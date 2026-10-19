import { useBackend } from '../backend';
import { Box, Button, ProgressBar, Section, Stack } from '../components';
import { Window } from '../layouts';

export const NIFLink = () => {
  const { act, data } = useBackend();
  const { power, maximum, durability, max_durability, calibrating, broken, nutrition, blood, price, programs = [] } = data;
  const unavailable = calibrating || broken || durability <= 0;
  return (
    <Window width={500} height={440}>
      <Window.Content scrollable>
        <Section title="Nanite Implant Framework">
          <Box mb={1}>Power</Box>
          <ProgressBar value={power} maxValue={maximum}>{Math.round(power)} / {maximum}</ProgressBar>
          <Box my={1}>Durability</Box>
          <ProgressBar value={durability} maxValue={max_durability}>{durability} / {max_durability}</ProgressBar>
          {!!calibrating && <Box mt={1} color="yellow">Calibration in progress.</Box>}
          {!!broken && <Box mt={1} color="bad">Recovering from EMP damage.</Box>}
        </Section>
        <Section title="Recharge">
          <Button.Checkbox checked={nutrition} disabled={unavailable} onClick={() => act('nutrition')}>Use nutrition</Button.Checkbox>
          <Button.Checkbox checked={blood} disabled={unavailable} onClick={() => act('blood')}>Use blood</Button.Checkbox>
        </Section>
        <Section title="Programs" buttons={<Button icon="download" disabled={unavailable} onClick={() => act('purchase')}>Holocaller ({price} cr)</Button>}>
          <Stack vertical>
            {programs.map((program) => (
              <Stack.Item key={program.ref}>
                <Box bold>{program.name}</Box>
                <Box mb={1}>{program.description}</Box>
                <Button selected={program.active} disabled={unavailable} onClick={() => act('activate', { ref: program.ref })}>{program.active ? 'Retract' : 'Project'}</Button>
                <Button.Confirm icon="trash" disabled={unavailable} onClick={() => act('remove', { ref: program.ref })}>Remove</Button.Confirm>
              </Stack.Item>
            ))}
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
