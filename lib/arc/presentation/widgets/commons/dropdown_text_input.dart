import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../src/styles/style.dart';

class DropdownTextInput<T> extends StatefulWidget {
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final FormFieldSetter<T>? onSaved;
  final Widget? labelText;
  final String? errorText;
  final Color? backgroundColor;
  final T? initialValue;
  final double borderRadius;
  final bool readOnly;
  final bool enabled;
  final AutovalidateMode autoValidateMode;
  final String? hint;
  final Widget Function(T item)? itemBuilder;
  final String Function(T item)? valueShow;
  final bool isExpanded;
  final Widget icon;

  const DropdownTextInput({
    Key? key,
    required this.items,
    this.errorText,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.hint,
    this.icon = const Icon(Icons.expand_more),
    this.backgroundColor,
    this.borderRadius = Dimens.size10,
    this.readOnly = false,
    this.enabled = true,
    this.labelText,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.initialValue,
    this.itemBuilder,
    this.valueShow,
    this.isExpanded = true,
  })  : assert(items.length == 0 || (itemBuilder != null || valueShow != null)),
        super(key: key);

  @override
  _DropdownTextInputState createState() => _DropdownTextInputState<T>();
}

class _DropdownTextInputState<T> extends State<DropdownTextInput<T>> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  InputBorder _inputBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initialVal = widget.initialValue;
    return IgnorePointer(
      ignoring: widget.readOnly || !widget.enabled,
      child: Container(
        color: widget.readOnly || !widget.enabled
            ? theme.backgroundColor
            : widget.backgroundColor,
        child: DropdownButtonFormField2<T>(
          buttonHeight: Dimens.size34,
          items: widget.items
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: widget.itemBuilder?.call(e) ??
                      Text(widget.valueShow?.call(e) ?? ''),
                ),
              )
              .toList(),
          value: initialVal,
          isExpanded: widget.isExpanded,
          key: ValueKey(initialVal),
          icon: widget.icon,
          dropdownDecoration: const BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(Dimens.defaultBorderRadius)),
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: theme.primaryTextTheme.bodyText1,
            suffixIconConstraints: const BoxConstraints(
              minWidth: Dimens.size20,
              maxHeight: Dimens.size20,
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Dimens.size10, vertical: Dimens.size5),
            isDense: true,
            errorText: widget.errorText,
            filled: widget.backgroundColor != null || !widget.enabled
                ? true
                : false,
            fillColor:
                !widget.enabled ? MyColors.lightButton : widget.backgroundColor,
            border: _inputBorder(MyColors.borderColor),
            enabledBorder: _inputBorder(MyColors.borderColor),
            focusedBorder: _inputBorder(MyColors.borderColor),
            errorBorder: _inputBorder(MyColors.borderColor),
            focusedErrorBorder: _inputBorder(MyColors.borderColor),
            disabledBorder: _inputBorder(MyColors.borderColor),
          ),
          autovalidateMode: widget.autoValidateMode,
          style: theme.primaryTextTheme.bodyText1,
          focusColor: Colors.transparent,
          //  dropdownColor: MyColors.lightButton,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator,
        ),
      ),
    );
  }
}
