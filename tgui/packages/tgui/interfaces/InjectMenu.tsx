import { useBackend } from '../backend';
import {Button,Section, BlockQuote, ProgressBar, Flex, Divider} from '../components';
import { Window } from '../layouts';


type InjectMenu_list = {
  subject: string;
  reagents: Reagent[];
  time_to_next_injection: number;
  evolve_poins: number;
};


type Reagent = {
  name: string;
}


export const InjectMenu = (props, context) => {
  const { act, data } = useBackend<InjectMenu_list>(context);
  return (
    <Window width={500} height={300}>
      <Window.Content scrollable>
        <Section
          fill={false}
          style={{ maxWidth: '100%' }}
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
          <Divider />
          <BlockQuote>Доступные реагенты:</BlockQuote>
          <Flex
            direction="row"
            wrap="wrap"
          >
            {data.reagents.map((reagent) => (
              <Button
                onClick={() => act('inject', { reagent_name: reagent.name })}
                style={{
                  width: 'calc(30% - 4px)',
                  margin: '2px',
                  flexGrow: 0,
                }}
              >{reagent.name} 5u</Button>
            ))}
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
