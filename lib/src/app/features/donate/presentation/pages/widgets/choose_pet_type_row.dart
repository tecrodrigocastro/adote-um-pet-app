part of '../donate_info_page.dart';

class _ChoosePetTypeRow extends StatefulWidget {
  @override
  State<_ChoosePetTypeRow> createState() => _ChoosePetTypeRowState();
}

class _ChoosePetTypeRowState extends State<_ChoosePetTypeRow> {
  Map<String, bool> buttonStates = {
    'cachorro': true,
    'gato': false,
    'aves': false,
    'coelhos': false,
  };

  void toggleSelection(String selected) {
    setState(() {
      buttonStates.updateAll((key, value) => false);

      buttonStates[selected] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Qual pet você gostaria de doar?',
          style: theme.textTheme.titleSmall,
        ),
        const Gap(8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['cachorro']!,
                onPressed: () => toggleSelection('cachorro'),
                title: 'Cachorro',
                image: AppImages.dogChooseButton,
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['gato']!,
                onPressed: () => toggleSelection('gato'),
                title: 'Gatos',
                image: AppImages.catChooseButton,
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['aves']!,
                onPressed: () => toggleSelection('aves'),
                title: 'Aves',
                image: AppImages.birdChooseButton,
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['coelho']!,
                onPressed: () => toggleSelection('coleho'),
                title: 'Coelhos',
                image: AppImages.coelhoChooseButton,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
