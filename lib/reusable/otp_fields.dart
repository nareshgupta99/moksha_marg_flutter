import 'package:flutter/material.dart';
import 'package:moksha_marg/util/dimensions.dart';

class OtpFields extends StatelessWidget {
  final void Function(String) onChanged;
  final _focusNode = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controllers ;

  OtpFields({super.key, required this.onChanged, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _focusNode.length,
        (index) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: OtpField(
            focusNode: _focusNode[index],
            first: controllers[index],
            onChanged: (value) {
              if (value.isEmpty && index > 0) {
                _focusNode[index - 1].requestFocus();
              } else if (value.isNotEmpty && index < _focusNode.length - 1) {
                _focusNode[index + 1].requestFocus();
              } else {
                _focusNode[index].unfocus();
              }
              onChanged(value);
            },
          ),
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final TextEditingController first;
  const OtpField({super.key, required this.focusNode, required this.onChanged, required this.first});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.padding6),
      child: SizedBox(
        width: (size.width - 144) / 6,
        height: (size.width - 144) / 6,
        child: TextField(
          maxLength: 1,
          focusNode: focusNode,
          onChanged: onChanged,
          textAlign: TextAlign.center,
          controller: first,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(counterText: "", fillColor: Colors.white, filled: true, border: UnderlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}