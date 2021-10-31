import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

enum Harilibur { tidak, ya }
enum Saudara { tidak, ya }

class _HomeState extends State<Home> {
  TextEditingController disco = TextEditingController();
  TextEditingController jumlaht = TextEditingController();
  TextEditingController kembaliant = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2000, 1);
  final lastDate = DateTime(2021, 12);
  Harilibur? _pil = Harilibur.tidak;
  Saudara? _pil2 = Saudara.tidak;
  bool? _harilibur = false;
  bool? _saudara = false;
  bool value = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
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
  String disko = "";
  String har = "";
  String saud = "";
  String jens = "";
  String pajak = "";
  String? _chosenValue = "Biasa";
  String? valueChoose;
  int a = 0, c = 0, z = 0, x = 0, v = 0;
  double b = 0, d = 0, e = 0;
  void proses() {
    //pesan
  }
  void total() {
    //rumus Jumlah Pembelian
  }
  void disc() {
    if (_chosenValue == "Biasa") {
      b = 0;
      b.toString();
    } else if (_chosenValue == "Pelanggan") {
      a = int.parse(jumlah.text);
      b = (a / 100) * 2;
      b.toString();
    } else if (_chosenValue == "P.Istimewa") {
      a = int.parse(jumlah.text);
      b = (a * 4) / 100;
      b.toString();
    }
    setState(() {
      disko = "$b";
    });
  }

  void harilib() {
    z = int.parse(jumlah.text);
    x = int.parse(disko);
    if (_pil == Harilibur.ya) {
      v = z - x - 2500;
      v.toString();
    } else {
      v = z - x;
      v.toString();
    }
    setState(() {
      har = "$v";
    });
  }

  int r = 0, t = 0;
  void saudar() {
    r = int.parse(har);
    if (_pil2 == Saudara.ya) {
      t = r - 5000;
      t.toString();
    } else if (_pil2 == Saudara.tidak) {
      t = r + 3000;
      t.toString();
    }
    setState(() {
      saud = "$t";
    });
  }

  int p = 0, o = 0;
  void jeniss() {
    if (value == true) {
      p = p + 100;
      p.toString();
    } else if (value2 == true) {
      p = p + 200;
      p.toString();
    } else if (value3 == true) {
      p = p - 500;
      p.toString();
    } else if (value4 == true) {
      p = p - 100;
      p.toString();
    } else {
      p = p;
      p.toString();
    }
    setState(() {
      jens = "$p";
    });
  }

  int l = 0;
  void ppn() {
    c = int.parse(jumlah.text);
    d = c * 10 / 100;
    d.toString();
    setState(() {
      pajak = "$d";
    });
  }

  void grandtot() {
    //grand total
  }
  void kembalian() {
    //kembalian yang di dapatkan
  }
  void ressets() {
    setState(() {
      nota.text = "";
      nama.text = "";
      jumlah.text = "";
      disko = "";
      _chosenValue = "Biasa";
      _pil = Harilibur.tidak;
      _pil2 = Saudara.tidak;
      value = false;
      value2 = false;
      value3 = false;
      value4 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(bottom: 30, right: 60)),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 268,
              height: 110,
              child: Column(
                children: <Widget>[
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
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "",
                              hintText: ""),
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
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "",
                              hintText: ""),
                          keyboardType: TextInputType.text,
                          controller: nama,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Container(
              width: 100,
              height: 100,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage("assets/images/Ellipse1.png"),
                fit: BoxFit.fill,
              )),
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
              textAlign: TextAlign.center,
              onChanged: (text) {
                disc();
                ppn();
              },
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
            height: 23,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Text(
              disko,
              textAlign: TextAlign.center,
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
            value: Harilibur.tidak,
            groupValue: _pil,
            onChanged: (Harilibur? value) {
              setState(() {
                _pil = value!;
              });
            },
          ),
          Text(
            'Tidak',
            style: new TextStyle(fontSize: 17.0),
          ),
          Radio(
            value: Harilibur.ya,
            groupValue: _pil,
            onChanged: (Harilibur? value) {
              setState(() {
                _pil = value!;
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
            value: Saudara.tidak,
            groupValue: _pil2,
            onChanged: (Saudara? value) {
              setState(() {
                _pil2 = value!;
              });
            },
          ),
          Text(
            'Tidak',
            style: new TextStyle(fontSize: 17.0),
          ),
          Radio(
            value: Saudara.ya,
            groupValue: _pil2,
            onChanged: (Saudara? value) {
              setState(() {
                _pil2 = value!;
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
          Padding(padding: EdgeInsets.only(left: 5)),
          Container(
            width: 100,
            child: Text(
              "Jenis Barang Dibeli",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              Text(
                'ABC',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(width: 10),
              Checkbox(
                value: this.value2,
                onChanged: (bool? value) {
                  setState(() {
                    this.value2 = value!;
                  });
                },
              ),
              Text(
                'BBB',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 5)),
          Container(
            width: 100,
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Checkbox(
                value: this.value3,
                onChanged: (bool? value) {
                  setState(() {
                    this.value3 = value!;
                  });
                },
              ),
              Text(
                'XYZ',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(width: 10),
              Checkbox(
                value: this.value4,
                onChanged: (bool? value) {
                  setState(() {
                    this.value4 = value!;
                  });
                },
              ),
              Text(
                'WWW',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
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
            height: 23,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Text(
              pajak,
              textAlign: TextAlign.center,
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
            height: 23,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Text(
              disko,
              textAlign: TextAlign.center,
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
            height: 23,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Text(
              disko,
              textAlign: TextAlign.center,
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
                ressets();
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
