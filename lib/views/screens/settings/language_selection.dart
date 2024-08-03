import 'package:clezigov/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

enum Language { english, french }

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key? key, required this.onChanged})
      : super(key: key);

  final Function(Language? value) onChanged;

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  Language? selectedGender;

  void _updateLanguage(Language? gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onChanged(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => _updateLanguage(Language.english),
          child: AnimatedContainer(
            duration: duration,
            padding: allPadding * 2,
            constraints: BoxConstraints(
              minHeight: 48.0,
              maxHeight: 56.0,
            ),
            decoration: formFieldDecoration.copyWith(
              color: selectedGender == Language.english
                  ? seedColorPalette.shade50
                  : Colors.white,
              border: Border.all(
                color: selectedGender == Language.english
                    ? seedColor
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Language.english.name.replaceFirst(Language.english.name[0],
                      Language.english.name[0].toUpperCase()),
                  style: AppTextStyles.body.copyWith(
                    color: selectedGender == Language.english
                        ? seedColor
                        : darkColor,
                  ),
                ),
                selectedGender == Language.english
                    ? Icon(
                        HugeIcons.strokeRoundedCheckmarkCircle02,
                        color: seedColor,
                      )
                    : SizedBox.shrink(),
                // sm-n986u
              ],
            ),
          ),
        ),
        Gap(16.0),
        GestureDetector(
          onTap: () => _updateLanguage(Language.french),
          child: AnimatedContainer(
            duration: duration,
            padding: allPadding * 2,
            constraints: BoxConstraints(
              minHeight: 48.0,
              maxHeight: 56.0,
            ),
            decoration: formFieldDecoration.copyWith(
              color: selectedGender == Language.french
                  ? seedColorPalette.shade50
                  : Colors.white,
              border: Border.all(
                color: selectedGender == Language.french
                    ? seedColor
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Language.french.name.replaceFirst(Language.french.name[0],
                      Language.french.name[0].toUpperCase()),
                  style: AppTextStyles.body.copyWith(
                    color: selectedGender == Language.french
                        ? seedColor
                        : darkColor,
                  ),
                ),
                selectedGender == Language.french
                    ? Icon(
                        HugeIcons.strokeRoundedCheckmarkCircle02,
                        color: seedColor,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
