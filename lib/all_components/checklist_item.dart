import 'package:check_it/constants.dart';
import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {

  ChecklistItem(
    Key? key,
    this.newUuid,
    this.removeItem
  ) : super(key: key);

  final newUuid;
  final removeItem;
  final TextEditingController item = new TextEditingController();
  final FocusNode focusNode = new FocusNode();

  bool isChecked = false;

  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}


class _ChecklistItemState extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            focusNode: widget.focusNode,
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
              widget.removeItem(widget.newUuid);
            },
            icon: Icon(Icons.clear_outlined))
      ],
    );

  }
}

