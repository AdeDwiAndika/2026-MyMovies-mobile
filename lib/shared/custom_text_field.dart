import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mymovies/core/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? titleValue;
  final String? rightTitle;
  final double? borderRadius;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final IconData? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final bool enabled;
  final bool capitalizeSentences;
  final bool allCaps;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.titleValue,
    this.rightTitle,
    this.borderRadius,
    this.suffixText,
    this.suffixStyle,
    this.labelText,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
    this.enabled = true,
    this.capitalizeSentences = false,
    this.allCaps = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  String? _errorText;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.titleValue ?? '',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              widget.rightTitle ?? '',
              style: TextStyle(color: AppColors.primary, fontSize: 14),
            ),
          ],
        ),
        Gap(4.0),
        TextFormField(
          enabled: widget.enabled,
          textCapitalization: widget.allCaps
              ? TextCapitalization.characters
              : widget.capitalizeSentences
              ? TextCapitalization.words
              : TextCapitalization.none,
          autofocus: false,
          cursorColor: AppColors.primary,
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: _obscureText,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          validator: (value) {
            final error = widget.validator?.call(value);
            setState(() {
              _errorText = error;
            });
            return error;
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: null,
            errorStyle: TextStyle(color: Colors.red, fontSize: 12, height: 0.8),
            // helperText: ' ',
            hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, size: 20, color: Colors.white)
                : null,
            prefixIconConstraints: BoxConstraints(minWidth: 56),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            suffixStyle:
                widget.suffixStyle ??
                TextStyle(color: Colors.white, fontSize: 14),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixText != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.suffixText!, style: widget.suffixStyle),
                      ],
                    ),
                  )
                : null,
            filled: true,
            fillColor: _errorText != null
                ? Colors.red.withOpacity(0.08)
                : _focusNode.hasFocus
                ? AppColors.primary.withOpacity(0.1)
                : Colors.white.withOpacity(0.05),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
              borderSide: BorderSide(color: AppColors.primary, width: 2.0),
            ),
            // 🔴 ERROR (INI YANG PENTING)
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),

            // 🔴 ERROR + FOCUS
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
