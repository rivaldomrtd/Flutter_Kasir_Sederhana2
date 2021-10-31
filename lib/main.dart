import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController nota = TextEditingController(
    text: '',
  );
  final TextEditingController nama = TextEditingController(
    text: '',
  );
  final TextEditingController jumlah = TextEditingController(
    text: '',
  );
  final TextEditingController diskon = TextEditingController(
    text: '',
  );
  final firstDate = DateTime(2000, 1);
  final lastDate = DateTime(2021, 12);
  int id = 1;
  int id2 = 1;
  bool? _harilibur = false;
  bool? _saudara = false;
  String _chosenValue = "Biasa";
  String? valueChoose;
  List listitem = ['Pembeli', 'Pelanggan', 'Pelanggan Istimewah'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(bottom: 30, left: 70)),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 20)),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
            Container(
              width: 100,
              child: Text(
                "No nota",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 155,
              height: 50,
              child: TextField(
                decoration: new InputDecoration(
                    border: OutlineInputBorder(), labelText: "", hintText: ""),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                ],
                controller: nota,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
            Container(
              width: 100,
              child: Text(
                "Nama Pembeli",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 155,
              height: 50,
              child: TextField(
                decoration: new InputDecoration(
                    border: OutlineInputBorder(), labelText: "", hintText: ""),
                keyboardType: TextInputType.text,
                controller: nama,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
            Container(
              width: 100,
              child: Text(
                "Jenis",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 95,
              child: DropdownButton<String>(
                value: _chosenValue,
                style: TextStyle(color: Colors.black),
                items: <String>[
                  'Biasa',
                  'Pelanggan',
                  'P.Istimewa',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Pilih",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 5,
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value!;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
      ]),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Tanggal Beli",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            child: TextField(
              onTap: () {
                _openDatePicker(context);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: '$selectedDate'.split(' ')[0],
                suffixIcon: Icon(
                  Icons.calendar_today_rounded,
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Jumlah Pembelian",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                  border: OutlineInputBorder(), labelText: "", hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              controller: jumlah,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Diskon",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                  border: OutlineInputBorder(), labelText: "", hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              controller: diskon,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      //------------
      //------------
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Hari Libur",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Radio(
            value: 1,
            groupValue: id,
            onChanged: (value) {
              setState(() {
                _harilibur = false;
                id = 1;
              });
            },
          ),
          Text(
            'Tidak',
            style: new TextStyle(fontSize: 17.0),
          ),
          Radio(
            value: 2,
            groupValue: id,
            onChanged: (val) {
              setState(() {
                _harilibur = true;
                id = 2;
              });
            },
          ),
          Text(
            'Ya',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Saudara",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Radio(
            value: 1,
            groupValue: id2,
            onChanged: (value) {
              setState(() {
                _saudara = false;
                id2 = 1;
              });
            },
          ),
          Text(
            'Tidak',
            style: new TextStyle(fontSize: 17.0),
          ),
          Radio(
            value: 2,
            groupValue: id2,
            onChanged: (val) {
              setState(() {
                _saudara = true;
                id2 = 2;
              });
            },
          ),
          Text(
            'Ya',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "PPN",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                  border: OutlineInputBorder(), labelText: "", hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              controller: diskon,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Grand Total",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                  border: OutlineInputBorder(), labelText: "", hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              controller: diskon,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Uang Dibayar",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                  border: OutlineInputBorder(), labelText: "", hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              controller: diskon,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: Text(
              "Kembalian",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 155,
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                  border: OutlineInputBorder(), labelText: "", hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              controller: diskon,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 5)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
          Container(
            width: 100,
            child: RaisedButton(
              child: Text("Proses"),
              onPressed: () {
                //Fungsi
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Container(
            width: 100,
            child: RaisedButton(
              child: Text("Reset"),
              onPressed: () {
                //Fungsi
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
    ])));
  }

  _openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
