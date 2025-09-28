import { useBackend } from '../backend';
import { Box, Button, Icon, LabeledList, Tabs, NoticeBox, Section, Stack, BlockQuote, ProgressBar, Flex, Divider, Collapsible} from '../components';
import { Window } from '../layouts';

type EvolveShopContext = {
  abilities: Ability[];
  current_stage: number;
};

type Ability = {
  name: string;
  desc: string;
  stage_required: number;
  can_purchase: boolean;
};

export const EvolveShop = (props, context) => {
  const { act, data } = useBackend<EvolveShopContext>(context);
  return (
    <Window width={900} height={480}>
      <Window.Content>
        <Section
          fill = {false}
          title={"Ваша текущая стадия: " + data.current_stage.toString()}
          >
            <Flex
            direction = "column"
            >
            <Flex.Item
            grow={0}
            >
              <BlockQuote>Это меню для развития вашей латексной сущности.
                В зависимости от стадии открываются новые способности.
                Ниже представлен ваш прогресс по очкам эволюции</BlockQuote>
            </Flex.Item>
            <Divider></Divider>
            <Flex.Item
            grow={0}
            >
              <ProgressBar ranges={{
                good: [0.6, 1],
                average: [0.2, 0.6],
                bad: [-Infinity, 0.2]
              }}
            value={0.3}
            />
            </Flex.Item>
            </Flex>
        </Section>
        <Section
          fill = {true}
          title = {'Описание стадий'}
        >
        <Section
          fill={false}
          title= {'Первая стадия'}
        >
        <BlockQuote>Более-менее сформировавшийся паразит, способный самостоятельно найти себе хозяина
          с помощью хитрых уловок. Все еще не умеет быть полезным для своего носителя, но этого достаточно,
          чтобы иметь способы насытится.
        </BlockQuote>
        <Collapsible
        title={'Список способностей стадии'}
        >
        {data.abilities.map((ability, index) => (
          <Tabs>
            <Tabs.Tab height={10}>
              {ability.name}
            </Tabs.Tab>
          </Tabs>
          ))}
        </Collapsible>
        <Button
        icon = {"dna"}
        >Эволюционировать</Button>
        </Section>
        <Section
          fill={false}
          title= {'Вторая стадия'}
        >
        <BlockQuote>Готовый для охоты организм, уже способный эффективно скрываться в теле носителя, а так же имеет
          продвинутые методы "кормления", а так же становится полезным для носителя, входя с ним в своеобразный симбиоз.
        </BlockQuote>
        <Collapsible
        title={'Список способностей стадии'}
        >текст</Collapsible>
        <Button
        icon = {"dna"}
        >Эволюционировать</Button>
        </Section>
        <Section
          fill={false}
          title= {'Третья стадия'}
        >
        <BlockQuote>По-настоящему серьезное и почти неуловимое существо, дающее невероятное наслаждение и силы носителю и способное передвигаться
          без помощи тела "хозяина", обретя самостоятельность.
        </BlockQuote>
        <Collapsible
        title={'Список способностей стадии'}
        >текст</Collapsible>
        <Button
        icon = {"dna"}
        >Эволюционировать</Button>
        </Section>
        </Section>
      </Window.Content>
    </Window>
  );
};
