import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_puzzle/category.dart';
import 'package:math_puzzle/winner.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Continue extends StatefulWidget {
  int cur_level;

  Continue(this.cur_level);

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  String ans = "";
  String f1 = "ff";
  int cur_level = 0;
  bool temp_board = false;
  SharedPreferences? pref;
  TextEditingController t1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
    cur_level = widget.cur_level;
  }

  get() async {
    pref = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("skip"),
                                  actions: [
                                    Text(
                                        "You can skip this level in 29 minute ")
                                  ],
                                );
                              },
                            );
                            // print("skip");
                            // pref!.setString("levelstatus$cur_level", "skip");
                            // cur_level++;
                            // pref!.setInt("levelno", cur_level);
                            // t1.text = "";

                            setState(() {});

                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/skip.png"))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            height: 60,
                            width: 200,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/level_board.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: Center(
                              child: Text(
                                "Puzzle ${cur_level + 1}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: f1,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            )),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "${demo.hint[widget.cur_level]}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          t1.text = "";
                                          setState(() {});
                                          return Navigator.pop(context);
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(right: 10, top: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/hint.png"))),
                          ),
                        ),
                      )
                    ]),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 110),
                        child: Image(
                          image:
                              AssetImage("images/${demo.board_img[cur_level]}"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 350,
                        color: Colors.black,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 35,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: TextField(
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        controller: t1,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if (t1.text != "") {
                                          t1.text = t1.text
                                              .substring(0, t1.text.length - 1);
                                        }
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/delete.png"))),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if (demo.ans[cur_level] ==
                                            int.parse(t1.text)) {
                                          pref!.setString(
                                              "levelstatus$cur_level", "win");
                                          cur_level++;
                                          pref!.setInt("levelno", cur_level);
                                          t1.text = "";
                                          setState(() {});
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return win(cur_level);
                                            },
                                          ));
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Wrong ans...",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        t1.text = "";
                                                        setState(() {});
                                                        return Navigator.pop(
                                                            context);
                                                      },
                                                      child: Text("Ok"))
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(0),
                                        child: Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      my_btn(1),
                                      my_btn(2),
                                      my_btn(3),
                                      my_btn(4),
                                      my_btn(5),
                                      my_btn(6),
                                      my_btn(7),
                                      my_btn(8),
                                      my_btn(9),
                                      my_btn(0),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget my_btn(int a) {
    return Expanded(
        child: Container(
      child: InkWell(
        onTap: () {
          t1.text += "$a";
        },
        child: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            "$a",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
      ),
    ));
  }
}
