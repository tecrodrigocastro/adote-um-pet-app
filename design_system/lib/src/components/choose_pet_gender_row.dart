import 'package:flutter/material.dart';
import '../../design_system.dart';
import 'package:gap/gap.dart';

class ChoosePetGenderRow extends StatefulWidget {
  const ChoosePetGenderRow({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<ChoosePetGenderRow> createState() => _ChoosePetGenderRowState();
}

class _ChoosePetGenderRowState extends State<ChoosePetGenderRow> {
  Map<String, bool> buttonStates = {
    'macho': true,
    'femea': false,
    'ambos': false,
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
          widget.label,
          style: theme.textTheme.titleSmall,
        ),
        const Gap(8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['macho']!,
                onPressed: () => toggleSelection('macho'),
                title: 'Macho',
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['femea']!,
                onPressed: () => toggleSelection('femea'),
                title: 'Fêmea',
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['ambos']!,
                onPressed: () => toggleSelection('ambos'),
                title: 'Ambos',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
