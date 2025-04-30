import 'package:flutter/material.dart';
import '../../design_system.dart';

class ChoosePetGenderRow extends StatefulWidget {
  const ChoosePetGenderRow({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final ValueChanged<String> onChanged;

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
                isSelected: buttonStates['macho']!,
                onPressed: () => toggleSelection('macho'),
                title: 'Macho',
              ),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['femea']!,
                onPressed: () => toggleSelection('femea'),
                title: 'Fêmea',
              ),
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
