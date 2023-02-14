import 'package:bunda_yuni_app/genosLib/component/JustHelper.dart';
import 'package:bunda_yuni_app/genosLib/component/button/genButton.dart';
import 'package:bunda_yuni_app/page/suksesPesan.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genRow.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/genToast.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/component/request.dart';
import '../genosLib/component/textfiled/TextField.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final req = new GenRequest();
  var dataBarang;
  bool isLoaded = false;
  bool readytoHit = true;
  var keterangan = "",
      nama = "",
      nomeja = "";
  int totalBayar = 0;

  DateTime? _selectedDate;
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  String? formatted;

  String jam = "00";
  String menit = "00";

  @override
  void initState() {
    // TODO: implement initState
    getDataKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalBayar = 0;

    return GenPage(
      appbar: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                            child: Icon(
                              Icons.chevron_left,
                              size: 30,
                            ))),
                  ),
                  Container(
                    // height: 80,
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: GenText(
                            "Keranjang Pesanan",
                            style: TextStyle(fontSize: 20),
                          ))),
                  // GenText(
                  //   "QR Code",
                  //   style: TextStyle(color: Colors.black87, fontSize: 35),
                  // )
                ]),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dataBarang == null
                        ? [
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ]
                        : dataBarang.map<Widget>((e) {
                      totalBayar =
                          totalBayar + int.parse(e["total"].toString());
                      return GenCardMenu(
                        ontap: () {
                          Navigator.pushNamed(context, "detail");
                        },
                        judul: e["barangs"]["nama"],
                        harga: formatRupiahUseprefik(e["total"]),
                        harga1: formatRupiahUseprefik(e["harga"]),
                        gambar: ip + e["barangs"]["image"],
                        badges: e["qty"].toString(),
                      );
                    }).toList()),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GenText("Total Pembayaran"),
                  GenText(
                    formatRupiahUseprefik(totalBayar),
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenButtonOutline(
                    text: "Pesan Makanan Lagi",
                    ontap: () {
                      Navigator.pushNamed(context, "home");
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenButton(
                    text: "Proses Pesanan",
                    ontap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0))),
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: MediaQuery
                                .of(context)
                                .viewInsets,
                            child: Container(
                              height: 600,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      GenText(
                                        "Total :" +
                                            formatRupiahUseprefik(totalBayar),
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      GenText(
                                        "Tentukan tanggal pesanan",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SfDateRangePicker(
                                        onSelectionChanged: _onSelectionChanged,
                                        selectionMode:
                                        DateRangePickerSelectionMode.single,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(width: double.infinity,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextLoginField(
                                                  initVal: jam,
                                                  width: double.infinity,
                                                  label: "Jam",
                                                  keyboardType: TextInputType
                                                      .number,
//                                    controller: tecNumber,
                                                  onChanged: (val) {
                                                    jam = val;
                                                  },

                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Expanded(
                                                child: TextLoginField(
                                                  initVal: menit,
                                                  width: double.infinity,
                                                  label: "Menit",
                                                  keyboardType: TextInputType
                                                      .number,
//                                    controller: tecNumber,
                                                  onChanged: (val) {
                                                    menit = val;
                                                  },

                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      readytoHit
                                          ? GenButton(
                                        text: "Proses Pesanan",
                                        ontap: () {
                                          prosesKeranjang(
                                              nama, nomeja, keterangan);
                                        },
                                      )
                                          : Center(
                                        child:
                                        CircularProgressIndicator(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(
            args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        formatted = formatter.format(_selectedDate!);
        toastShow(formatted.toString(), context, Colors.black45);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  void getDataKeranjang() async {
    dataBarang = await req.getApi("cart");

    print("DATA $dataBarang");

    setState(() {});
  }

  void prosesKeranjang(nama, nomeja, nominal) async {
    if (_selectedDate == null || _selectedDate == "") {
      toastShow("Silahkan memilih tanggal pesanan", context, Colors.black);
    } else {
      setState(() {
        readytoHit = false;
      });

      if(jam.length < 1 || int.parse(jam) < 0 || int.parse(jam) > 24){
        toastShow("Masukan Jam dengan benar", context, Colors.black);
        setState(() {
          readytoHit = true;
        });
      }else if(menit.length < 1 || int.parse(menit) < 0 || int.parse(menit) > 60){
        toastShow("Masukan menit dengan benar", context, Colors.black);
        setState(() {
          readytoHit = true;
        });
      }else{
        var dataProses =

        await req.postApi("cart/checkout", {"tanggal": formatted, "jam": jam+":"+menit});
        if (dataProses == "berhasil") {
          Navigator.pushNamed(context, "suksesPesan",
              arguments: SuksesPesanPage(
                total: totalBayar,
                nama: nama,
                tanggal: formatted,
              ));
        } else {
          // toastShow("Barang  gagal dimasukan keranjang", context, Colors.black);
          toastShow("Keranjang gagal di proses", context, Colors.black);

          setState(() {
            readytoHit = true;
          });

          print("DATA $dataProses");
      }


      }
    }
  }
}
