import 'package:flutter/material.dart';

import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/screens/add_tasks_screen.dart';

class TopBar extends StatelessWidget {
  final String title = 'Listie';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 25.0,
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                'images/icon_listie.png',
                width: 48.0,
                height: 48.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                title,
                style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  fontFamily: kLetterTypeTitle,
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48,
            width: 48,
            child: RaisedButton(
                color: Colors.blueGrey,
                elevation: 8.0,
//              padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
//                side: BorderSide(color: Colors.red),
                ),
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
//                  fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AddTaskScreen(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
