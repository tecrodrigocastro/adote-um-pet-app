import 'package:flutter/material.dart';
import '../../design_system.dart';
import 'package:gap/gap.dart';

class ChoosePetSizeRow extends StatefulWidget {
  const ChoosePetSizeRow({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<ChoosePetSizeRow> createState() => _ChoosePetSizeRowState();
}

class _ChoosePetSizeRowState extends State<ChoosePetSizeRow> {
  Map<String, bool> buttonStates = {
    'pequeno': true,
    'medio': false,
    'grande': false,
    'enorme': false,
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
                isSelected: buttonStates['pequeno']!,
                onPressed: () => toggleSelection('pequeno'),
                title: 'Pequeno',
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['medio']!,
                onPressed: () => toggleSelection('medio'),
                title: 'Médio',
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['grande']!,
                onPressed: () => toggleSelection('grande'),
                title: 'Grande',
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['enorme']!,
                onPressed: () => toggleSelection('enorme'),
                title: 'Enorme',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
