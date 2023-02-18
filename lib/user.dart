
import 'package:blackjack/paper.dart';

import 'pieceOfPaper.dart';
import 'dart:io';

class User {
  //name of user
  String? name;

  //user list of pieces of paper
  // it is optional to display all the pieces of paper in the list of user.
  List<PieceOfPaper> UserList = [];

  //point of user list
  int points = 0;
  final Paper paper;
  User(String? nameOfUser,{required  this.paper}) {
    name = nameOfUser;
    // takeAPaper(paper.mainPaperList);
    takeAPaper(paper.mainPaperList);
    takeAPaper(paper.mainPaperList);

  }


  //taking a paper from the mainList
  PieceOfPaper takeAPaper(List<String> elements) {
    PieceOfPaper pieceOfPaper = PieceOfPaper(stringOfPaper: elements.last);
    UserList.add(pieceOfPaper);
    elements.removeLast();
    points += pieceOfPaper.points;
    return pieceOfPaper;
  }

}
