import { useBackend } from '../backend';
import { Box, Button, Icon, LabeledList, Tabs, NoticeBox, Section, Stack, BlockQuote, ProgressBar, Flex, Divider, Collapsible} from '../components';
import { Window } from '../layouts';

type InjectMenu = {
  subject: string;
  reagents: Reagent[];
  time_to_next_injection: number;
  evolve_poins: number;
};

type Reagent = {
  name: string;
}

export const InjectMenu = (props, context) => {
  const { act, data } = useBackend<InjectMenu>(context);
  return (
    <Window width={500} height={300}>
      <Window.Content>
        <Section
          fill={false}
          title={"Ввод реагентов в " + data.subject}
        >
          <BlockQuote>Шкала очков эволюции</BlockQuote>
          <ProgressBar ranges={{
            good: [0.6, 1],
            average: [0.2, 0.6],
            bad: [-Infinity, 0.2]
          }}
            value={data.evolve_poins}
            />
            <Divider></Divider>
            <BlockQuote>Доступные реагенты:</BlockQuote>
          <Flex
            direction={'row'}
          >
            {data.reagents.map((reagent, index) => (
              <Button
                onClick={() => act('inject', {"reagent_name": reagent.name})}
              >{reagent.name} 5u</Button>
            ))}
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
