import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class PricePage extends StatefulWidget {
  PricePage({Key key}) : super(key: key);

  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price'),
      ),
      body: Column(
        children: [
          Price(label: '123=>', value: 123),
          Price(label: '123.456=>', value: 123.456, decimal: 2),
          Price(label: '123.454=>', value: 123.454),
          Price(label: '123.4=>', value: 123.4, decimal: 2),
          Price(label: '123.45=>', value: 123.45),
          Price(label: '123.54=>', value: 123.54, decimal: 0),
          Price(label: '123.54=>', value: 123.54),
          Price(label: '123456.7890=>', value: 123456.7890, thousands: true, decimal: 4),
          Price(
            currency: CurrencySymbol.CNY,
            label: '价格',
            labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
            fontWeight: FontWeight.w600,
            color: Colors.red,
            symbolColor: Colors.green,
            value: 123456.78,
            thousands: true,
            decimal: 2,
            size: 16,
            symbolSize: 12,
            shrink: true,
          ),
          Price(
            currency: CurrencySymbol.CNY,
            label: '价格',
            labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
            fontWeight: FontWeight.w600,
            color: Colors.red,
            symbolColor: Colors.green,
            value: 123456.78,
            thousands: true,
            size: 16,
            symbolSize: 12,
            shrink: false,
          ),
        ],
      ),
    );
  }
}
