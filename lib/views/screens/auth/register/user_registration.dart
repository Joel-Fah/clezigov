import 'package:clezigov/models/occupation.dart';
import 'package:clezigov/views/widgets/form_fields/gender_selection.dart';
import 'package:clezigov/views/widgets/form_fields/simple_text_field.dart';
import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../models/cities.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/form_fields/dropdown_form_field.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  static const String routeName = '/userRegistration';

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _userRegistrationFormKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _searchCityController = TextEditingController();
  final TextEditingController _searchOccupationController =
      TextEditingController();

  // Form fields
  String? value, city, occupation;
  Gender? gender;

  // Form validation
  bool isNameFilled = false, isCityFilled = false, isOccupationFilled = false, isGenderFilled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(() {
      setState(() {
        isNameFilled = _nameController.text.isNotEmpty;
      });
    });

    _cityController.addListener(() {
      setState(() {
        isCityFilled = _cityController.text.isNotEmpty;
      });
    });

    _occupationController.addListener(() {
      setState(() {
        isOccupationFilled = _occupationController.text.isNotEmpty;
      });
    });

    _genderController.addListener(() {
      setState(() {
        isGenderFilled = _genderController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _occupationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("User registration"),
        ),
        body: Form(
          key: _userRegistrationFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: [
              Text(
                "Hey, welcome to you 👋🏽",
                style: AppTextStyles.h2,
              ),
              Gap(8.0),
              Text(
                "We are happy to have you among us. Let’s begin by knowing each other.",
                style: AppTextStyles.body,
              ),
              Gap(8.0),
              Row(
                children: [
                  Icon(
                    LucideIcons.info,
                    color: Theme.of(context).disabledColor,
                    size: 16.0,
                  ),
                  Gap(8.0),
                  Expanded(
                    child: Text(
                      "If you instead want to sign up with your Google account or Apple ID, go back to the previous screen.",
                      style: AppTextStyles.small.copyWith(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  )
                ],
              ),
              Gap(20.0),
              SimpleTextFormField(
                controller: _nameController,
                hintText: "How should we call you?",
                prefixIcon: Icon(LucideIcons.user2),
                textCapitalization: TextCapitalization.words,
              ),
              Gap(16.0),
              DefaultDropdownFormField(
                searchController: _searchCityController,
                hintText: 'Residence city',
                prefixIcon: Icon(LucideIcons.home),
                items: cities.map((city) => city.name).toList(),
                searchTitle: 'Select your city',
                onChanged: (String? value) {
                  city = value;
                  // update controller
                  _cityController.text = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "You must select a residence city";
                  }
                  return null;
                },
              ),
              Gap(16.0),
              DefaultDropdownFormField(
                searchController: _searchOccupationController,
                hintText: 'Occupation',
                prefixIcon: Icon(LucideIcons.contact2),
                items:
                    occupations.map((occupation) => occupation.name).toList(),
                searchTitle: 'Select your occupation',
                onChanged: (String? value) {
                  occupation = value;
                  _occupationController.text = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "You must select an occupation";
                  }
                  return null;
                },
              ),
              Gap(16.0),
              GenderSelectionFormField(
                onChanged: (value) {
                  gender = value;
                  _genderController.text = value!.name;
                },
              ),
              Gap(24.0),
              PrimaryButton.label(
                onPressed: (isNameFilled && isCityFilled && isOccupationFilled && isGenderFilled)
                    ? () {
                        if (_userRegistrationFormKey.currentState!.validate()) {
                          // Save and proceed
                        }
                        debugPrint(
                            "isNameFilled: $isNameFilled, city: $city, occupation: $occupation, gender: $gender");
                      }
                    : null,
                label: "Save and proceed",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
