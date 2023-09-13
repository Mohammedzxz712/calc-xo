import 'package:calculater/modules/calc/calc_item.dart';
import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: 180,
            child: Text(
              result,
              style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 26),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcItemScreen('7', onClick),
                CalcItemScreen('8', onClick),
                CalcItemScreen('9', onClick),
                CalcItemScreen('/', onOperate),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcItemScreen('4', onClick),
                CalcItemScreen('5', onClick),
                CalcItemScreen('6', onClick),
                CalcItemScreen('*', onOperate),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcItemScreen('1', onClick),
                CalcItemScreen('2', onClick),
                CalcItemScreen('3', onClick),
                CalcItemScreen('-', onOperate),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcItemScreen('0', onClick),
                CalcItemScreen('.', onClick),
                CalcItemScreen('=', onEqual),
                CalcItemScreen('+', onOperate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onClick(txt) {
    if (op == '=') {
      op = '';
      lhs = '';
      result = '';
    }
    setState(() {
      result += txt;
    });
  }

  String op = '';
  String lhs = '';

  onEqual(txt) {
    result = calculate(lhs, result, op);
    op = '=';
    setState(() {});
  }

  String calculate(String lhs, String rhs, String op) {
    double LHS = double.parse(lhs);
    double RHs = double.parse(rhs);
    double res;
    if (op == '+') {
      res = LHS + RHs;
      return res.toString();
    } else if (op == '-') {
      res = LHS - RHs;
      return res.toString();
    } else if (op == '*') {
      res = LHS * RHs;
      return res.toString();
    } else if (op == '/') {
      res = LHS / RHs;
      return res.toString();
    }
    return '';
  }

  onOperate(txt) {
    if (op.isEmpty) {
      lhs = result;
      op = txt;
    } else {
      String ress = calculate(lhs, result, op);
      lhs = ress;
      op = txt;
    }
    result = '';
    print(lhs);
    setState(() {});
  }
}
