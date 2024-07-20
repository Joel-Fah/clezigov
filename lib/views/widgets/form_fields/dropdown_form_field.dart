import 'package:clezigov/utils/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DefaultDropdownFormField extends StatefulWidget {
  const DefaultDropdownFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.validator,
    required this.items,
    this.value,
    this.searchTitle,
    this.searchTitleWidget,
    required this.searchController,
  }) : assert(searchTitle != null || searchTitleWidget != null,
            "Either title or titleWidget must be provided but not both");

  final String hintText;
  final Icon prefixIcon;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final List<String> items;
  final String? value, searchTitle;
  final Widget? searchTitleWidget;
  final TextEditingController searchController;

  @override
  State<DefaultDropdownFormField> createState() =>
      _DefaultDropdownFormFieldState();
}

class _DefaultDropdownFormFieldState extends State<DefaultDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: formFieldDecoration,
      child: DropdownSearch<String>(
        dropdownButtonProps: DropdownButtonProps(
          tooltip: "Expand",
          icon: Icon(LucideIcons.chevronsUpDown),
        ),
        popupProps: PopupProps.modalBottomSheet(
            showSelectedItems: true,
            showSearchBox: true,
            searchDelay: duration * 3,
            loadingBuilder: (context, searchEntry) {
              return Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: seedColorPalette.shade200,
                  rightDotColor: seedColor,
                  size: 50.0,
                ),
              );
            },
            itemBuilder: (context, item, isSelected) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius * 2,
                  color: isSelected
                      ? seedColor.withOpacity(0.08)
                      : Colors.transparent,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius * 2,
                  ),
                  title: Text(
                    item,
                    style: AppTextStyles.body.copyWith(
                      color: isSelected ? seedColor : null,
                      fontWeight: isSelected ? FontWeight.bold : null,
                    ),
                  ),
                  selected: isSelected,
                  trailing: isSelected
                      ? Icon(
                          LucideIcons.check,
                          color: seedColor,
                        )
                      : null,
                ),
              );
            },
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: widget.searchTitleWidget ??
                  Text(widget.searchTitle!, style: AppTextStyles.h3),
            ),
            listViewProps: ListViewProps(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
            modalBottomSheetProps: ModalBottomSheetProps(
              enableDrag: true,
              isScrollControlled: true,
            ),
            emptyBuilder: (context, searchEntry) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.search,
                      color: Theme.of(context).disabledColor.withOpacity(0.24),
                      size: 80.0,
                    ),
                    Gap(24.0),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: "No entry for \""),
                        TextSpan(
                          text: searchEntry,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "\" found.",
                        ),
                      ]),
                      style: AppTextStyles.body.copyWith(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              );
            },
            searchFieldProps: TextFieldProps(
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: "Start typing...",
                prefixIcon: Icon(LucideIcons.search),
                suffixIcon: widget.searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(LucideIcons.x),
                        onPressed: () {
                          setState(() {
                            widget.searchController.clear();
                          });
                        },
                      )
                    : null,
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: seedColor,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: dangerColor,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: dangerColor,
                    width: 1.5,
                  ),
                ),
              ),
            )),
        items: widget.items,
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: AppTextStyles.body,
          dropdownSearchDecoration: InputDecoration(
            hintText: widget.hintText,
            constraints: BoxConstraints(
              minHeight: 48.0,
              maxHeight: 56.0,
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: borderRadius * 2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius * 2,
              borderSide: BorderSide(
                color: seedColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius * 2,
              borderSide: BorderSide(
                color: dangerColor,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius * 2,
              borderSide: BorderSide(
                color: dangerColor,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius * 2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius * 2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
        ),
        onChanged: widget.onChanged,
        selectedItem: widget.value,
        validator: widget.validator,
      ),
    );
  }
}
