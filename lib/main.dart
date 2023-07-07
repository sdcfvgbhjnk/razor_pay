import 'package:math_puzzle/category.dart';
import 'package:math_puzzle/second.dart';
import 'package:math_puzzle/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: dashboard(),
  ));
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String f1 = "ff";
  bool temp1 = false;
  bool temp2 = false;
  bool temp3 = false;
  int cur_level = 0;
  List level_status = [];
  SharedPreferences? pref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level_status = List.filled(demo.ans.length, "panding");
    get().then((value) {
      print("cur_level:${cur_level}");

      cur_level = pref!.getInt("levelno") ?? 0;

      print("cut_level:${cur_level}");

      for (int i = 0; i < cur_level; i++) {

        level_status[i] = pref!.getString("levelstatus$i");

      }

      print(level_status);

    });
  }

  Future get() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/background.jpg"))),
        child: Column(children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Math Puzzles",
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/blackboard_main_menu.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTapUp: (details) {
                      temp1 = false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Continue(cur_level);
                        },
                      ));
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp1 = true;
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp1 = false;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: (temp1)
                              ? Border.all(color: Colors.grey, width: 3)
                              : null),
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: f1,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapUp: (details) {
                      temp2 = false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return lock(level_status, cur_level);
                        },
                      ));
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp2 = true;
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp2 = false;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: (temp2)
                              ? Border.all(color: Colors.grey, width: 3)
                              : null),
                      child: Text(
                        "PUZZLES",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: f1,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapUp: (details) {
                      temp3 = false;
                    },
                    onTapDown: (details) {
                      temp3 = true;

                      setState(() {});
                    },
                    onTapCancel: () {
                      temp3 = false;

                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: (temp3)
                              ? Border.all(color: Colors.grey, width: 3)
                              : null),
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: f1,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 5, 10),
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.grey, Colors.white]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(),
                    ),
                    child: Image(
                      image: AssetImage("images/shareus.png"),
                      width: 35,
                      height: 35,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.grey, Colors.white]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(),
                    ),
                    child: Image(
                      image: AssetImage(
                        "images/emailus.png",
                      ),
                      width: 35,
                      height: 35,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
            ],
          ),
        ]),
      ),
    ));
  }
}
