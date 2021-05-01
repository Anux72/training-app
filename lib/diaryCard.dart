import 'package:flutter/material.dart';

class DiaryCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final int cardColor;

  DiaryCard({this.cardColor, this.description, this.subtitle, this.title});

  @override
  State<StatefulWidget> createState() {
    return _DiaryCardState();
  }
}

class _DiaryCardState extends State<DiaryCard> {
  var descriptionLines = 3;
  String showButtonText = 'more';
  bool isExpanded = false;

  void show() {
    if (isExpanded) {
      setState(() {
        descriptionLines = 3;
        showButtonText = 'more';
        isExpanded = false;
      });
    } else {
      setState(() {
        descriptionLines = 1000;
        showButtonText = 'less';
        isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(widget.cardColor),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              widget.title,
              maxLines: 2,
              style: TextStyle(
                  color: Color(0xff353839),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.all(7),
          ),
          Container(
            child: Text(
              widget.subtitle,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.fromLTRB(8, 0, 0, 20),
          ),
          Container(
            child: Text(
              widget.description,
              maxLines: descriptionLines,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff353839),
                  decoration: TextDecoration.none),
            ),
            margin: EdgeInsets.fromLTRB(8, 0, 0, 30),
          ),
          TextButton(
            onPressed: show,
            child: Text(
              'Show ' + showButtonText,
              style: TextStyle(
                color: Color(0xff353839),
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
