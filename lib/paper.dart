import 'dart:math';
class Paper {
  final List _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List _lordsOfPaper = ["Lord", "Queen", "King"];
  final List _typesOfPaper = ["R", "B", "C", "A"];
  List _wholeList = [];
  List<String> mainPaperList = [];
  Paper() {
    _wholeList += _numbers.sublist(0);
    _wholeList += _lordsOfPaper.sublist(0);
    for (int i = 0; i < 52; i++) {
      mainPaperList.add("${_wholeList[i % 13]} of ${_typesOfPaper[i % 4]}");
    }
    mainPaperList.shuffle();
  }

  //optional methods
  void swap(var r1, var r2) {
    var t = r1;
    r1 = r2;
    r2 = t;
  }
  void shuffle(List elements) {
    Random r = Random();
    for (int i = 0; i < 100; i++) {
      swap(elements[r.nextInt(elements.length)], r.nextInt(elements.length));
    }
  }
}