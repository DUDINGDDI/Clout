// Global
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// Widgets
import 'package:clout/widgets/input/input_elements/utilities/numeric_range_formatter.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';

class PayInputDialog extends StatelessWidget {
  PayInputDialog(
      {super.key,
      this.setData,
      this.value,
      this.valueString,
      this.setValueString,
      this.converter}) {
    valueString ??= '0원';
  }

  var value;
  var valueString;
  final setData;
  final setValueString;
  final converter;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("희망 광고비"),
      content: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
            height: 75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    inputFormatters: [
                      NumericRangeFormatter(min: 0, max: 1000000000)
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '희망 광고비 입력',
                        contentPadding: EdgeInsets.only(left: 15, right: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: style.colors['main1']!, width: 2))),
                    initialValue: value,
                    onChanged: (newVal) {
                      setData(newVal);
                      setValueString(converter(newVal));
                      setState(() => value = newVal);
                      setState(() => valueString = converter(newVal));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(valueString),
                      DataTitle(
                        text: '원',
                      )
                    ],
                  )
                ]));
      }),
      actions: <Widget>[
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setValueString(valueString);
              Navigator.of(context).pop(); //창 닫기
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: style.colors['main1']),
            child: Text("확인"),
          ),
        ),
      ],
    );
  }
}