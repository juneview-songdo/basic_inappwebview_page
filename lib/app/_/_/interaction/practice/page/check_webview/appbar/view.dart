import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class AppbarView extends StatefulWidget implements PreferredSizeWidget {
  AppbarView({super.key});

  @override
  State<AppbarView> createState() => StateChild();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppbarViewState extends State<AppbarView>
    with StateMother, AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      // leading: IconButton(
      //   icon: const Icon(Icons.home),
      //   color: Colors.white,
      //   onPressed: () {},
      // ),
      titleSpacing: 0.0,
      title: SizedBox(
        height: 40.0,
        child: Stack(
          children: <Widget>[
            TextField(
              onSubmitted: (value) {},
              keyboardType: TextInputType.url,
              // focusNode: _focusNode,
              autofocus: false,
              controller: _searchController,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 45.0, top: 10.0, right: 10.0, bottom: 10.0),
                filled: true,
                fillColor: Colors.white,
                border: outlineBorder,
                focusedBorder: outlineBorder,
                enabledBorder: outlineBorder,
                hintText: "Search for or type a web address",
                hintStyle:
                    const TextStyle(color: Colors.black54, fontSize: 16.0),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ).padding(left: 12,right: 10),
      actions: <Widget>[
        InkWell(
          // key: tabInkWellKey,
          child: Container(
            margin: const EdgeInsets.only(
                left: 10.0, top: 15.0, right: 10.0, bottom: 15.0),
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.white),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0)),
            constraints: const BoxConstraints(minWidth: 25.0),
            child: Center(
                child: Text(
              "3",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
            )),
          ),
        ),
        PopupMenuButton<String>(
          // onSelected: _popupMenuChoiceAction,
          itemBuilder: (popupMenuContext) {
            return [];
          },
          iconColor: Colors.white,
        )
      ],
    );
  }

  TextEditingController? _searchController = TextEditingController();

  OutlineInputBorder outlineBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
  );

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _searchController?.text = "https://docs.flutter.dev";
  }
}

main() async {
  return buildApp(appHome: AppbarView().center());
}
