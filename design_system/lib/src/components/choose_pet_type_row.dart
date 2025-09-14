import 'package:flutter/material.dart';
import '../../design_system.dart';

class ChoosePetTypeRow extends StatefulWidget {
  const ChoosePetTypeRow({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final ValueChanged<String> onChanged;

  @override
  State<ChoosePetTypeRow> createState() => _ChoosePetTypeRowState();
}

class _ChoosePetTypeRowState extends State<ChoosePetTypeRow> {
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

    widget.onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.label,
          style: theme.textTheme.titleSmall,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            spacing: 10,
            children: [
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['cachorro']!,
                onPressed: () => toggleSelection('cachorro'),
                title: 'Cachorro',
                image: AppImages.dogChooseButton,
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['gato']!,
                onPressed: () => toggleSelection('gato'),
                title: 'Gatos',
                image: AppImages.catChooseButton,
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['aves']!,
                onPressed: () => toggleSelection('aves'),
                title: 'Aves',
                image: AppImages.birdChooseButton,
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['coelhos']!,
                onPressed: () => toggleSelection('coelhos'),
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
