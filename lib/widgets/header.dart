import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/consts/constants.dart';
import 'package:grocery_admin_panel/services/utils.dart';
import '../responsive.dart';

class Header extends StatelessWidget {
  const Header(
      {Key? key,
      required this.fct,
      required this.title,
      this.showTextField = true})
      : super(key: key);

  final VoidCallback fct;
  final String title;
  final bool showTextField;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              fct;
            },
          ),
        if (Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (Responsive.isDesktop(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        !showTextField
            ? Container()
            : Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
