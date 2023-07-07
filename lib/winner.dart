import 'package:flutter/material.dart';
import 'package:math_puzzle/second.dart';
//import 'package:mathpuzzle/second.dart';
//import 'package:mathpuzzle/third.dart';

//import 'dashboard.dart';
import 'main.dart';
//import 'package:mathpuzzles/dashboard.dart';

class win extends StatefulWidget {
  int cur_level;
  win(this.cur_level);



  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  bool continu = false;
  bool mainmenu = false;
  bool buy = false;


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "PUZZLE ${widget.cur_level } COMPLETED",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigo),
                  ),
                ),
              ),
              Expanded(flex: 5,
                child: Center(
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/trophy.png"),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                    child: GestureDetector(onTapUp: (details) {
                      continu =false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Continue(widget.cur_level);
                      },));
                    },
                      onTapDown: (details) {
                        continu = true;
                      },
                      onTapCancel: () {
                        continu = false;
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black12, Colors.white, Colors.black12]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(),
                        ),
                        child: Center(child: Text(
                          "CONTINUE",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),),
                      ),
                    )),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Center(
                    child: GestureDetector(
                      onTapUp: (details) {
                        mainmenu = false;
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return dashboard();
                        },));
                      },
                      onTapDown: (details) {
                        mainmenu = true;
                      },
                      onTapCancel: () {
                        mainmenu = false;
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black12, Colors.white, Colors.black12]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(),
                        ),
                        child: Center(child: Text(
                          "MAIN MENU",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),),
                      ),
                    )),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Center(
                    child: GestureDetector(onTapUp:(details) {
                      buy = false;
                    },
                      onTapDown: (details) {
                        buy = true;
                      },onTapCancel: () {
                        buy = false;
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black12, Colors.white, Colors.black12]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                            "BUY PRO",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "SHARE THIS PUZZLE",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigo),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return dashboard();
                        },
                      ));
                    },
                    child: Center(
                      child: Container(
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
                          width: 40,
                          height: 45,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
