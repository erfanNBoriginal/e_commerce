import 'package:flutter/cupertino.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class Card extends StatelessWidget {
  final EdgeInsets? padding;
  final double radius;
  final double? width;
  final List<BoxShadow> boxShadows;
  final double? height;
  final double borderWidth;
  final Color borderColor;
  final Widget child;
  const Card({super.key,
    this.padding ,
   this.boxShadows = const[ BoxShadow(
       color:  Color.fromARGB(20, 0, 0, 0),
       spreadRadius: 1,
       blurRadius: 15,
       offset:  Offset(2, 2), 
       // ↑ negative Y offset = shadow on top only
     ),
    //  BoxShadow(
    //    color:  Color.fromARGB(10, 0, 0, 0),
    //    spreadRadius: 1,
    //    blurRadius: 15,
    //    offset:  Offset(0, 1), 
    //    // ↑ negative Y offset = shadow on top only
    //  )
     ],
      this.radius =8,
      required this.child,
        this.borderWidth = 0,  
      this.borderColor =U.Theme.white,
       this.width,
        this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
         color: U.Theme.white,
   borderRadius: BorderRadius.circular(radius),
   border: Border.all(color: borderColor, width: 0),
   boxShadow: 
   boxShadows
    //  BoxShadow(
    //    color: const Color.fromARGB(20, 0, 0, 0),
    //    spreadRadius: 1,
    //    blurRadius: 10,
    //    offset: const Offset(0, 6), 
    //    // ↑ negative Y offset = shadow on top only
    //  ),
   
      ),
      child: child,
    );
  }
}