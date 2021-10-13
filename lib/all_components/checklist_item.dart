import 'package:check_it/constants.dart';
import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {
  final newUuid;
  final removeItem;
  ChecklistItem(
    Key? key,
    this.newUuid,
    this.removeItem
  ) : super(key: key);
  final TextEditingController item = new TextEditingController();
  bool isChecked = false;
  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}


class _ChecklistItemState extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("_ChecklistItemState"+ widget.item.text.trim());
    print("_ChecklistItemState NewUuid" + widget.newUuid);
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: kDarkBlue,
          activeColor: kYellow,
          value: widget.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.isChecked = value!;
            });
          },
        ),
        Expanded(
          child: TextFormField(
            controller: widget.item,
            maxLines: null,
            decoration: InputDecoration(
              // enabledBorder: InputBorder.none,
              // focusedBorder: InputBorder.none,
            ),
          ),
        ),
         IconButton(
            onPressed: () {
              print(widget.newUuid);
              widget.removeItem(widget.newUuid);
            },
            icon: Icon(Icons.clear_outlined))
      ],
    );

  }
}

