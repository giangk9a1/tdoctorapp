import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../src/constants.dart';
import '../../../../src/styles/style.dart';

class CustomTextfield extends StatefulWidget {
  final double? paddingHor;
  final double? paddingVer;
  final double? textfieldHeight;
  final bool? obscureText;
  final String? hindText;
  final Color? color;
  final bool? enabled;
  final VoidCallback? onTap;
  final int maxLines;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final VoidCallback? showHideVoid;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Widget? preIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool noBorder;
  const CustomTextfield({
    Key? key,
    this.paddingHor,
    this.onTap,
    this.paddingVer,
    this.textfieldHeight = 45,
    this.obscureText,
    this.hindText,
    this.maxLength,
    this.color,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.enabled = true,
    this.textInputAction,
    this.keyboardType,
    this.showHideVoid,
    this.controller,
    this.onChange,
    this.preIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
  })  : noBorder = false,
        super(key: key);
  const CustomTextfield.noBorder({
    Key? key,
    this.paddingHor,
    this.onTap,
    this.paddingVer,
    this.textfieldHeight = 45,
    this.obscureText,
    this.hindText,
    this.maxLength,
    this.color,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.enabled = true,
    this.textInputAction,
    this.keyboardType,
    this.showHideVoid,
    this.controller,
    this.onChange,
    this.preIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
  })  : noBorder = true,
        super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.paddingHor ?? 16,
          vertical: widget.paddingVer ?? 7),
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          height: widget.textfieldHeight,
          child: TextFormField(
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            controller: widget.controller,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            cursorColor: Theme.of(context).primaryColor,
            onChanged: widget.onChange,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            obscureText: widget.isPassword ? !_passwordVisible : false,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              errorStyle: theme.textTheme.bodyMedium,
              hintText: widget.hindText,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              isDense: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: Dimens.size10),
                child: widget.preIcon,
              ),
              suffixIcon: widget.suffixIcon ??
                  (widget.isPassword
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 12, end: 15),
                            child: Image.asset(
                              !_passwordVisible
                                  ? ImageAssetPath.icEye
                                  : ImageAssetPath.icEye,
                              color: theme.colorScheme.secondary,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        )
                      : null),
              fillColor: widget.color,
              filled: !widget.noBorder,
              border: InputBorder.none,
              counterText: '',
              prefixIconConstraints: const BoxConstraints(
                  minWidth: Dimens.size26, maxHeight: Dimens.size26),
              contentPadding: widget.noBorder
                  ? const EdgeInsets.symmetric(vertical: 10)
                  : const EdgeInsets.all(10),
              enabledBorder: widget.noBorder
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(128, 141, 176, 1)),
                    ),
              disabledBorder: widget.noBorder
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(128, 141, 176, 1)),
                    ),
              focusedBorder: widget.noBorder
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(128, 141, 176, 1)),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
