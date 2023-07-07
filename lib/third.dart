import 'package:flutter/material.dart';
import 'package:math_puzzle/second.dart';
// import 'package:math_puzzle/third2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lock extends StatefulWidget {
  List level_status;
  int cur_level;

  lock(this.level_status, this.cur_level);

  @override
  State<lock> createState() => _lockState();
}

class _lockState extends State<lock> {
  String f1 = "ff";
  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                          height: 99,
                          child: Center(
                            child: Text(
                              "Select Puzzle",
                              style: TextStyle(
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          )))
                ],
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 0.9),
                itemCount: 40,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                  if(index<=widget.cur_level)
                    {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Continue(index);
                        },
                      ));

                    }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: (widget.cur_level > index)
                          ? Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 40, fontFamily: f1),
                            )
                          : null,
                      decoration: BoxDecoration(
                          image: (widget.cur_level > index)
                              ? (widget.level_status[index] == "win")
                                  ? DecorationImage(
                                      image: AssetImage("images/tick.png"))
                                  : null
                              : DecorationImage(
                                  image: AssetImage("images/lock.png"))),
                    ),
                  );
                },
              )),

            ],
          ),
        ),
      ),
    );
  }
}
