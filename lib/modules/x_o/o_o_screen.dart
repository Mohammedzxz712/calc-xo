import 'package:calculater/models/model_names.dart';
import 'package:flutter/material.dart';

import 'item_botton.dart';

class XoScreen extends StatefulWidget {
  static const String routeName = 'xo';

  @override
  State<XoScreen> createState() => _XoScreenState();
}

class _XoScreenState extends State<XoScreen> {
  List<String> item = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int score1 = 0;
  int score2 = 0;

  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context)?.settings.arguments as ModelName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Xo Game'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name.nam1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    name.nam2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$score1',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '$score2',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoItemScreen(item[0], 0, click),
                XoItemScreen(item[1], 1, click),
                XoItemScreen(item[2], 2, click),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoItemScreen(item[3], 3, click),
                XoItemScreen(item[4], 4, click),
                XoItemScreen(item[5], 5, click),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoItemScreen(item[6], 6, click),
                XoItemScreen(item[7], 7, click),
                XoItemScreen(item[8], 8, click),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int count = 1;

  void click(index) {
    if (item[index].isNotEmpty) return;
    if (count % 2 == 0) {
      setState(() {
        item[index] = 'X';
        score1 += 2;
        bool win = winner('X');
        if (win == true) {
          score1 += 10;
          reset();
        }
      });
    } else {
      setState(() {
        item[index] = 'O';
        score2 += 2;
        bool win = winner('O');
        if (win == true) {
          score2 += 10;
          reset();
        }
      });
    }
    if (count == 9) {
      reset();
    }
    count++;
  }

  bool winner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (item[i] == symbol && item[i + 1] == symbol && item[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (item[i] == symbol && item[i + 3] == symbol && item[i + 6] == symbol) {
        return true;
      }
    }
    if (item[0] == symbol && item[4] == symbol && item[8] == symbol) {
      return true;
    }
    if (item[2] == symbol && item[4] == symbol && item[6] == symbol) {
      return true;
    }
    return false;
  }

  void reset() {
    item = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    count = 0;
  }
}
