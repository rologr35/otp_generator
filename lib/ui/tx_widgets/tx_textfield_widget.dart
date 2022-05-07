

import 'package:flutter/material.dart';

import '../../res/R.dart';

class TXTextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool obscureText;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;
  final int minLines;
  final Function()? onSuffixIconTap;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Color? inputBorderColor;
  final Color? suffixIconColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? hintColor;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadiusMagnitude;
  final bool enabled;

  const TXTextFieldWidget(
      {Key? key,
      this.label = '',
      this.borderRadiusMagnitude = 4,
      this.hintColor,
      this.hintText,
      required this.controller,
      this.validator,
      this.textInputAction,
      this.textInputType,
      this.contentPadding,
      this.obscureText = false,
      this.suffixIcon,
      this.onChanged,
      this.maxLines = 1,
      this.onSubmitted,
      this.minLines = 1,
      this.enabled = true,
      this.prefixIcon,
      this.onSuffixIconTap,
      this.focusNode,
      this.nextFocus,
      this.inputBorderColor,
      this.suffixIconColor,
      this.cursorColor,
      this.textColor,
      this.labelColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TXTextFieldWidgetState();
}

class _TXTextFieldWidgetState extends State<TXTextFieldWidget> {
  bool passwordVisible = false;

  IconData get passwordIcon {
    if (passwordVisible) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      controller: widget.controller,
      validator: widget.validator,
      cursorColor: widget.cursorColor ?? R.color.primaryColor,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines:
          widget.minLines > widget.maxLines ? widget.maxLines : widget.minLines,
      keyboardType: widget.textInputType ?? TextInputType.text,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      obscureText: widget.obscureText && !passwordVisible,
      onChanged: widget.onChanged,
      onFieldSubmitted: (term) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(term);
        }
        widget.textInputAction == TextInputAction.done
            ? FocusScope.of(context).unfocus()
            : FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      style: TextStyle(color: widget.textColor ?? R.color.grayDarkColor, fontSize: 16),
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: widget.hintColor ?? R.color.grayColor, fontSize: 16),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          labelText: widget.label,
          labelStyle:
              TextStyle(color: widget.labelColor ?? R.color.grayColor),
          errorMaxLines: 7,
          prefixIcon: widget.prefixIcon,
          suffixIcon: InkWell(
            onTap: widget.obscureText
                ? () {
                    _setPasswordVisible(!passwordVisible);
                  }
                : widget.onSuffixIconTap,
            child: Icon(
              widget.obscureText ? passwordIcon : widget.suffixIcon,
              color: widget.suffixIconColor ?? R.color.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.inputBorderColor ?? R.color.grayColor,
                  width: .8),
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadiusMagnitude))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.inputBorderColor ?? R.color.grayColor,
                  width: .8),
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadiusMagnitude))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.inputBorderColor ?? Colors.redAccent,
                  width: .8),
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadiusMagnitude))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.inputBorderColor ?? R.color.grayColor,
                  width: .8),
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadiusMagnitude)))),
    );
  }

  _setPasswordVisible(bool visible) {
    setState(() {
      passwordVisible = visible;
    });
  }
}
