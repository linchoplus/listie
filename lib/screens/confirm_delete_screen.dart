import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';

import 'package:listie_app/models/task_data.dart';
import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/settings/vars.dart';

class ConfirmDelete extends StatefulWidget {
  @override
  _ConfirmDeleteState createState() => _ConfirmDeleteState();
}

class _ConfirmDeleteState extends State<ConfirmDelete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Delete selected tasks?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: kLetterTypeSubtitle,
                color: kMainColor,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  color: kMainColor,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontFamily: kLetterTypeTitle,
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    checked = false;
                    print('Confirm = $checked');
                    TaskData().deleteSelected();
                    Provider.of<TaskData>(context, listen: false)
                        .deleteSelected();
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  color: kMainColor,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: kLetterTypeTitle,
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
