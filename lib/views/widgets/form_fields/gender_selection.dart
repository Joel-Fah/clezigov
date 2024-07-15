import 'package:clezigov/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum Gender { male, female }

class GenderSelectionFormField extends StatefulWidget {
  const GenderSelectionFormField({Key? key, required this.onChanged}) : super(key: key);

  final Function(Gender? value) onChanged;

  @override
  _GenderSelectionFormFieldState createState() =>
      _GenderSelectionFormFieldState();
}

class _GenderSelectionFormFieldState extends State<GenderSelectionFormField> {
  Gender? selectedGender;

  void _updateGender(Gender? gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onChanged(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _updateGender(Gender.male),
            child: AnimatedContainer(
              duration: duration,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0,),
              constraints: BoxConstraints(
                minHeight: 48.0,
                maxHeight: 56.0,
              ),
              decoration: formFieldDecoration.copyWith(
                color: selectedGender == Gender.male
                    ? seedColorPalette.shade400
                    : Colors.white,
                border: Border.all(
                  color: selectedGender == Gender.male
                      ? seedColor
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  selectedGender == Gender.male
                      ? Icon(
                    LucideIcons.checkCircle2,
                    color: scaffoldBgColor,
                  )
                      : SizedBox.shrink(),
                  Gap(8.0),
                  Text(
                    Gender.male.name.replaceFirst(Gender.male.name[0],
                        Gender.male.name[0].toUpperCase()),
                    style: AppTextStyles.body.copyWith(
                      color: selectedGender == Gender.male
                          ? scaffoldBgColor
                          : darkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(16.0),
        Expanded(
          child: GestureDetector(
            onTap: () => _updateGender(Gender.female),
            child: AnimatedContainer(
              duration: duration,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0,),
              constraints: BoxConstraints(
                minHeight: 48.0,
                maxHeight: 56.0,
              ),
              decoration: formFieldDecoration.copyWith(
                color: selectedGender == Gender.female
                    ? seedColorPalette.shade400
                    : Colors.white,
                border: Border.all(
                  color: selectedGender == Gender.female
                      ? seedColor
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  selectedGender == Gender.female
                      ? Icon(
                    LucideIcons.checkCircle2,
                    color: scaffoldBgColor,
                  )
                      : SizedBox.shrink(),
                  Gap(8.0),
                  Text(
                    Gender.female.name.replaceFirst(Gender.female.name[0],
                        Gender.female.name[0].toUpperCase()),
                    style: AppTextStyles.body.copyWith(
                      color: selectedGender == Gender.female
                          ? scaffoldBgColor
                          : darkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
