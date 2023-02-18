
import 'package:blackjack/paper.dart';
import 'package:blackjack/user.dart';
import 'package:flutter/material.dart';
import 'Widgets.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlackJack(),
    );
  }
}

class BlackJack extends StatefulWidget {
  const BlackJack({Key? key}) : super(key: key);

  @override
  State<BlackJack> createState() => _BlackJackState();
}

final Paper paper = Paper();
var paperlist = paper.mainPaperList;

class _BlackJackState extends State<BlackJack> {
  Future restart() {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          Paper p = Paper();
          User u1 = User("me", paper: p);
          User u2 = User("Computer", paper: p);
          user1 = u1;
          user2 = u2;
          paperlist = p.mainPaperList;
          key1 = true;
          gamekey = true;
          hide = true;
          computerendend = false;
          victory = false;
          congratulation = false;
          deal  =false ;
          check();
        });
      },
    );
  }

  @override
  void initState() {
    check();
    super.initState();
    // FlutterNativeSplash.remove();
  }

  void check() {
    if(user1.points==user2.points){
      deal = true;
    }else if (user1.points > 21) {
      gamekey = false;
      computerendend = false;
      victory = false;
      counter = 0;
      hide = false;
      counter = 0;
      restart();
    } else if (user1.points == 21) {
      gamekey = false;
      victory = true;
      counter++;
      if (counter == 4) {
        congratulation = true;
        counter = 0;
      }
      computerendend = false;
      hide = false;
      restart();
    }
  }

  var key1 = true,
      deal = false ,
      gamekey = true,
      hide = true,
      computerendend = false,
      victory = false,
      congratulation = false,
      counter = 0;
  User user1 = User("Computer", paper: paper);
  User user2 = User("Me", paper: paper);

  @override
  Widget build(BuildContext context) {
    var mobileWidth = MediaQuery.of(context).size.width;
    var mobileHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(245, 245, 220, 1),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const text1(
                  textone: "21 BlackJack",
                ),
                SizedBox(
                  height: mobileHeight / 20,
                  width: mobileWidth / 4.8,
                  child: Center(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      i < counter ? Colors.green : Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        }),
                  ),
                ),
                text2(
                  texttwo: hide
                      ? "Computer Paper, Points : ?? "
                      : "Computer Paper, Points : ${user2.points} ",
                ),
                SizedBox(
                  height: 120,
                  width: mobileWidth,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ListView.builder(
                            itemCount: user2.UserList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  PaperWidget(
                                    color: hide
                                        ? Colors.grey
                                        : user2.UserList[i].color(),
                                    height: 110,
                                    width: 90,
                                    icon: user2.UserList[i].icon,
                                    num: hide
                                        ? "?"
                                        : user2.UserList[i].points.toString(),
                                  )
                                ],
                              );
                            }),
                      ),
                      computerendend && gamekey
                          ? Container(
                              height: 120,
                              width: mobileWidth,
                              color: Colors.black.withOpacity(0.4),
                              child: const Center(
                                  child: Text(
                                "Computer Ended.",
                                style: TextStyle(color: Colors.white),
                              )),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const text1(
                  textone: "Chose your order.",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button1(
                        enableKey: gamekey,
                        icon: Icons.add,
                        s: "Add paper",
                        fun: () {
                          setState(() {
                            user1.takeAPaper(paperlist);
                            check();
                            user2.points <= 15
                                ? user2.takeAPaper(paperlist)
                                : computerendend = true;
                          });
                        }),
                    Button1(
                      enableKey: gamekey,
                      icon: Icons.stop,
                      s: "Enough",
                      fun: () {
                        setState(() {
                          hide = false;
                          computerendend = false;
                          gamekey = false;
                          if (user1.points==user2.points){
                            deal = true ;
                          }else if (user1.points > user2.points ||
                              user2.points > 21) {
                            victory = true;
                            counter++;
                            if (counter == 4) {
                              congratulation = true;
                              counter = 0;
                            }
                          } else if (user2.points > user1.points) {
                            counter = 0;
                          }
                        });
                        restart();
                      },
                    ),
                  ],
                ),
                text2(
                  texttwo: "Your Paper, Points : ${user1.points} ",
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    height: 120,
                    width: mobileWidth,
                    child: ListView.builder(
                        itemCount: user1.UserList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              PaperWidget(
                                color: user1.UserList[i].color(),
                                height: 110,
                                width: 90,
                                icon: user1.UserList[i].icon,
                                num: user1.UserList[i].points.toString(),
                              )
                            ],
                          );
                        }),
                  ),
                ),
                const text1(
                  textone: "The result of the battle.",
                ),
                SizedBox(
                    width: mobileWidth,
                    height: mobileHeight / 8,
                    child: gamekey
                        ? const SizedBox()
                        : Center(
                            child: Text(
                                deal? "Deal..":
                                victory ? "You Win.." : "You Lose..",
                                style: TextStyle(
                                    color: deal? Colors.black:victory ? Colors.green : Colors.red,
                                    fontSize: 32))))
              ],
            ),
            if (congratulation)
              Container(
                  width: mobileWidth,
                  height: mobileHeight,
                  color: Colors.green.withOpacity(0.7),
                  child: const Center(
                      child: Text(
                    "Congratulation 🔥",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  )))
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
