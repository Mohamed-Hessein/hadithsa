import 'package:flutter/material.dart';
import 'package:wazker/Featured/utils/AppColors.dart';

class Custombuttongetstarted extends StatelessWidget {
  const Custombuttongetstarted({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 4,

            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Appcolors.Kprimiry,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Cairo",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
