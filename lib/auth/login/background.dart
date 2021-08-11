import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class Background extends StatelessWidget {
  final  child;
  const Background({@required this.child});

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              right: -200,
              top: -200,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.asset(
                  'Images/triangle_blob.png',
                  width: 500,
                ),
              )),
          child
        ],
      ),
    );
  }
}