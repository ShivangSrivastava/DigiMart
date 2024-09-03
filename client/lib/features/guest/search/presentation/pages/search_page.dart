import 'package:client/shared/shared_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBarBloc, NavigationBarState>(
      listener: (context, state) {
        if (state is NavigationBarChangeIndexState) {
          if (state.currentIndex == 1) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FocusScope.of(context).requestFocus(_focusNode);
            });
          }
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: MediaQuery.of(context).viewPadding.top),
        child: Column(
          children: [
            SearchBarWidget(
              focusNode: _focusNode,
              onTap: () {},
            ),
            Container(
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
