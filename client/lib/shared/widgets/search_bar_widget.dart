// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback onTap;
  final FocusNode? focusNode;
  const SearchBarWidget({
    super.key,
    required this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: focusNode,
      hintText: "Search",
      onTap: onTap,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      trailing: [
        IconButton(
          tooltip: "Search Product",
          icon: Icon(UIcons.regularRounded.search),
          onPressed: () {},
        )
      ],
    );
  }
}
