import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter/services.dart';

class TextInput extends StatefulWidget {
  final double height;
  final String title;
  final bool numbersOnly;
  final String? errorMessage;
  final bool hasError;
  final double borderRadius;
  final TextEditingController textCtrl;
  final Widget? trailing;
  final bool autoFocus;
  const TextInput({
    this.errorMessage,
    this.hasError = false,
    this.numbersOnly = false,
    super.key,
    this.trailing,
    this.height = 64,
    this.autoFocus = true,
    this.borderRadius = 4,
    required this.title,
    required this.textCtrl,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool isFocused = false;

  final focusNode = FocusNode();

  @override
  void initState() {
    if (widget.autoFocus) {
      focusNode.requestFocus();
    }
    focusNode.addListener(() {
      isFocused = focusNode.hasFocus;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
        isFocused = !isFocused;
        setState(() {});
      },
      child: Stack(
        children: [
            
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              border: Border.all(color:  widget.hasError ? U.Theme.primary : U.Theme.white),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color:U.Theme.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        
                        if (widget.textCtrl.text.isNotEmpty || isFocused)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 33.0,
                              bottom: 14,
                              left: 20,
                            ),
                            child: TextField(
                              keyboardType:TextInputType.number,
                                inputFormatters: [
                // This ensures *only* digits (no letters, no symbols)
            if(widget.numbersOnly) 
               FilteringTextInputFormatter.digitsOnly,
              ],
                              // expands: true,
                              maxLines: null,
                              onEditingComplete: () {},
                              style: TextStyle(fontSize: 14),
                              controller: widget.textCtrl,
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                              ),
                              focusNode: focusNode,
                            ),
                          ),
                        AnimatedPositioned(
                          top:
                              (widget.textCtrl.text.isNotEmpty || isFocused)
                                  ? 14
                                  : 22,
                          right: 20,
                          duration: Duration(milliseconds: 100),
                          child: U.Text(
                            fontSize:
                                (widget.textCtrl.text.isNotEmpty || isFocused)
                                    ? U.TextSize.s11
                                    : U.TextSize.s14,
                            color: U.Theme.gray,
                            widget.title,
                            weight: U.TextWeight.medium,
                          ),
                        ),
                     
                      ],
                    ),
                  ),
                  if (widget.trailing != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (widget.trailing!),
                    ),
                ],
              ),
            ),
          ),
             if(widget.hasError)AnimatedPositioned(
                            bottom: 0,
                            left: 5,
                            duration: Duration(milliseconds: 100),
                            child: U.Text(
                              weight: U.TextWeight.regular ,
                              fontSize: U.TextSize.s11,
                              color: U.Theme.primary,
                              widget.errorMessage!)),
        ],
      ),
    );
  }
}
