import 'package:flutter/material.dart';
import '../../design_system.dart';
import 'package:gap/gap.dart';

class ChoosePetDonationTypeRow extends StatefulWidget {
  const ChoosePetDonationTypeRow({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final ValueChanged<String> onChanged;

  @override
  State<ChoosePetDonationTypeRow> createState() =>
      _ChoosePetDonationTypeRowState();
}

class _ChoosePetDonationTypeRowState extends State<ChoosePetDonationTypeRow> {
  Map<String, bool> buttonStates = {
    'temporario': true,
    'permanente': false,
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
                isSelected: buttonStates['temporario']!,
                onPressed: () => toggleSelection('temporario'),
                title: 'Temporário',
              ),
              const Gap(10),
              SelectableButtonDs(
                width: 100,
                height: 30,
                isSelected: buttonStates['permanente']!,
                onPressed: () => toggleSelection('permanente'),
                title: 'Permanente',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
