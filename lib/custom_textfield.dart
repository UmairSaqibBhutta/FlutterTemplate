import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hint;
  Widget? prefixWidget;
  final Widget? suffixWidget;
  bool obscureText;
  bool isshowPasswordControls;
  TextStyle? hintTextStyle;
  bool? isEnabled;
  List<TextInputFormatter>? inputFormats;
  int? maxlines;
  int? minlines;
  final String? headerText;
  TextInputType? inputType;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? errorText;
  var autofillHints;

  CustomTextField(
      {Key? key,
      this.controller,
      this.inputFormats,
      this.hint = '',
      this.prefixWidget,
      this.inputType,
      this.suffixWidget,
      this.obscureText = false,
      this.isshowPasswordControls = false,
      this.maxlines,
      this.isEnabled,
      this.hintTextStyle,
      this.onSubmit,
      this.focusNode,
      this.onChange,
      this.minlines,
      this.errorText,
      this.autofillHints,
      this.headerText})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();

    // widget.isObscure ?? false;
    widget.isEnabled ?? true;
    // widget.isshowPasswordControls;
    log("widget.maxlines = ${widget.maxlines}");

    if (!widget.obscureText) {
      widget.maxlines ?? 2;
      widget.minlines ?? 1;
    }

    log("isObscure  = ${widget.obscureText}");
    log("isshowPasswordControls = ${widget.isshowPasswordControls}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.headerText == null
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.headerText == null ? 0.0 : 6.0,
                    vertical: widget.headerText == null ? 0.0 : 4.0),
                child: Text(
                  widget.headerText!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
        Container(
          height: widget.maxlines != null && widget.maxlines! > 1 ? 70 : 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              // const Color(0xFF979797).withOpacity(0.1)
              color: whiteColor,
              borderRadius: BorderRadius.circular(8.0)),
          margin: const EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: TextField(
            autofillHints: widget.autofillHints,
            textCapitalization: TextCapitalization.sentences,
            inputFormatters: widget.inputFormats,
            focusNode: widget.focusNode,
            cursorColor: appColor,
            maxLines: widget.obscureText ? 1 : widget.maxlines,
            autocorrect: true,
            style: const TextStyle(fontSize: 14),
            onSubmitted: widget.onSubmit,
            minLines: widget.obscureText ? 1 : widget.minlines,
            controller: widget.controller,
            enabled: widget.isEnabled,
            keyboardType: widget.inputType ?? TextInputType.text,
            obscureText: widget.obscureText,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 6.0),

              // border: OutlineInputBorder(

              //     borderRadius: BorderRadius.circular(10)),
              // focusedBorder: InputBorder.none,
              // enabledBorder: InputBorder.none,

              hintText: widget.hint,
              hintStyle: widget.hintTextStyle ?? const TextStyle(fontSize: 14),
              errorText: widget.errorText,
              suffixIcon: widget.suffixWidget,
              prefixIcon: widget.prefixWidget == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: widget.prefixWidget,
                    ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
