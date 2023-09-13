import 'package:flutter/material.dart';

class CalcItemScreen extends StatelessWidget {
  String text;
  Function calculate;

  CalcItemScreen(this.text, this.calculate);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            BeveledRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
            ),
          ),
        ),
        onPressed: () {
          calculate(text);
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
