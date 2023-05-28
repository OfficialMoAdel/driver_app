import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String>? values;
  final ValueChanged? onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  AnimatedToggle({
    @required this.values,
    @required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });

  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final reducedWidth = screenWidth * 0.3;
    final reducedHeight = screenHeight * 0.04;

    return Container(
      width: reducedWidth,
      height: reducedHeight,
      margin: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                initialPosition = !initialPosition;
                var index = initialPosition ? 0 : 1;
                widget.onToggleCallback!(index);
              });
            },
            child: Container(
              width: reducedWidth,
              height: reducedHeight,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(reducedWidth * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values!.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: reducedWidth * 0.12),
                    child: Text(
                      widget.values![index],
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: reducedWidth * 0.091,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xAA000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: reducedWidth * 0.55,
              height: reducedHeight,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(reducedWidth * 0.1),
                ),
              ),
              child: Center(
                child: Text(
                  initialPosition ? widget.values![0] : widget.values![1],
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: reducedWidth * 0.091,
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
