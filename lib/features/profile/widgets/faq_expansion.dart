import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/profile/pages/faq_page.dart';

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget({Key? key, required  this.step}) : super(key: key);
final Stepe step;
  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      child:
        ExpansionTile(
          onExpansionChanged: (bool expanded) {
            setState(() => isExpanded = expanded);
          },
          trailing: isExpanded ? Icon(
            Icons.minimize,
            color: Colors.black,
          ): Icon(
            Icons.add_circle_outline_sharp,
            color: Colors.black,
          ),
          title: Text(
          "${widget.step.title}",
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${widget.step.body}',style: TextStyle(fontSize: 20,height: 1.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
