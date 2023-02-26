import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/services/utils.dart';
import 'package:grocery_admin_panel/widgets/text_widget.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;

    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Theme.of(context).cardColor.withOpacity(0.4),
      child: Row(
        children: [
          Flexible(
            flex: size.width < 650 ? 3 : 1,
            child: Image.network('https://www.pngplay.com/wp-content/uploads/2/Banana-PNG-Free-File-Download.png',
            fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(text: '12x For \$19.9', color: color,
                textSize: 16, isTitle: true,
                ),
                FittedBox(
                  child: Row(
                    children: [
                      TextWidget(text: 'By', color: Colors.blue,
                        textSize: 16, isTitle: true,
                      ),
                      TextWidget(text: 'Hadi K.', color: color,
                        textSize: 14, isTitle: true,
                      ),
                    ],
                  ),
                ),
                const Text('20/03/2022'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
