import 'package:flutter/material.dart';

class PieceOfPaper{
  IconData? icon;
  int points =0 ;
  String? stringPaper ;
  PieceOfPaper({required String stringOfPaper}){
    stringPaper= stringOfPaper;
    points = pointsOfPaper();
    icon = papericon();
  }
  int pointsOfPaper(){
    String? sample ;
    sample  = stringPaper![0]+stringPaper![1];
    if(sample=='10'){
      points+=10;
    }
    else{
      sample = stringPaper![0];
      if(sample == 'L'){
        points += 11;
      }else if(sample == 'Q'){
        points += 12;
      }else if(sample == 'K'){
        points += 13;
      }else{
        int? tot = int.tryParse(sample);
        tot??= 0 ;
        points+=tot;
      }
    }
    return points ;
  }
  IconData? papericon(){
    String? c= stringPaper![stringPaper!.length-1] ;
    if(c=='R'){
      return Icons.favorite_border;
    }else if (c =='C'){
      return Icons.check_box_outline_blank;
    }else if (c =='B'){
      return Icons.panorama_fisheye_rounded;
    }else if (c =='A'){
      return Icons.wb_cloudy_outlined;
    }
    return null ;
  }
  Color? color(){
    String? c= stringPaper![stringPaper!.length-1] ;
    if(c=='R'){
      return Colors.red.withOpacity(0.8);
    }else if (c =='C'){
      return Colors.green.withOpacity(0.8);
    }else if (c =='B'){
      return Colors.blue.withOpacity(0.8);
    }else if (c =='A'){
      return Color.fromRGBO(233, 158, 19,1);
    }
    return null ;
  }

}
