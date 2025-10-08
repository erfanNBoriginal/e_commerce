import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final void Function() onSearched;
  final String hintText;
  final bool isSearched;
  const SearchInput({
    super.key,
    required this.controller,
    required this.onSearched,
    required this.isSearched,
    required this.hintText,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  bool isFocused = false;
  String lastSearch = '';
  late bool textIsEmpty;
  final focusNode = FocusNode();
  @override
  void initState() {
    textIsEmpty = widget.controller.text.isEmpty;
    lastSearch = widget.controller.text;
    widget.controller.addListener(() {
      textIsEmpty = widget.controller.text.isEmpty;
      if (textIsEmpty && widget.isSearched) {
        onSearch();
      }
      setState(() {});
    });

    focusNode.addListener(() {
      isFocused = focusNode.hasFocus;
      print(isFocused);
      setState(() {});
    });

    super.initState();
  }

  void onSearch() {
    if ((!widget.isSearched && !textIsEmpty) ||
        lastSearch != widget.controller.text) {
      lastSearch = widget.controller.text;
      widget.onSearched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Container(
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: U.Theme.white,
          border: Border.all(
            color: isFocused ? U.Theme.primary : U.Theme.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                onSearch();
              },
              child: U.Image.Icon(image: U.Icons.search),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.hintText,
                ),
                controller: widget.controller,
                onEditingComplete: () {
                  onSearch();
                },
              ),
            ),
            SizedBox(width: 3),
            if (widget.controller.text.isNotEmpty)
              GestureDetector(
                onTap: () {
                  widget.controller.clear();
                },
                child: U.Image.Icon(image: U.Icons.minus),
              ),
          ],
        ),
      ),
    );
  }
}
