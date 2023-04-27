import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? callBack;
  final String text;
  final String variation;
  final double width;
  final double height;
  const CustomButton(
      {super.key,
      required this.text,
      required this.variation,
      this.callBack,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            onPressed: callBack,
            style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size.fromHeight(40)),
                backgroundColor: variation == 'Black'
                    ? MaterialStateProperty.all(const Color(0XFF121313))
                    : MaterialStateProperty.all(Colors.white)),
            child: Text(text,
                style: variation == 'Black'
                    ? Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white)
                    : Theme.of(context).textTheme.displayMedium)),
      ),
    );
  }
}
