import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final Color rightColor;
  final Color leftColor;
  final String leftText;
  final String rightText;
  final Icon icon;
  final Function onTap;

  const CustomBottom(
      {Key key,
      this.onTap,
      this.rightColor,
      this.leftColor,
      this.leftText,
      this.rightText,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            leftText,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          LayoutBuilder(builder: (_, constraints) {
            return GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    height: constraints.maxHeight,
                    color: rightColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Text(
                        rightText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      icon,
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    ]),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
