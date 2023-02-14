import 'package:bunda_yuni_app/genosLib/component/JustHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../genosLib/component/button/genButton.dart';
import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/genText.dart';

class SuksesPesanPage extends StatefulWidget {

  int? total;
  String? nama;
  String? tanggal;

  SuksesPesanPage({ this.total, this.nama, this.tanggal});

  @override
  State<SuksesPesanPage> createState() => _SuksesPesanPageState();
}

class _SuksesPesanPageState extends State<SuksesPesanPage> {

  int? total = 0;
  String? nama = "";
  String? nomeja = "";


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as SuksesPesanPage;
    total = args.total;
    nama = args.nama;
    nomeja = args.tanggal;

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

                    ),
                  ),
                  Container(
                      // height: 80,
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: GenText(
                            "Pesanan Berhasil",
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
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/sukses.png", height: 300,),
                    GenText("Tanggal :"+formatTanggalFromString(nomeja!), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 10,),
                    GenText("Total :"+formatRupiahUseprefik(total), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 20,),
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.all(color: Colors.green)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline, color: Colors.green),
                          SizedBox(width: 5,),
                          GenText(
                            "Mohon tunggu konfirmasi dari kami",
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // GenText("Total Pembayaran"),
                  // GenText(
                  //   "Rp 50.000",
                  //   style: TextStyle(
                  //       color: Colors.orange,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 25),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  GenButton(
                    text: "Kembali ke Menu Utama",
                    ontap: () {
                      Navigator.pushNamed(context, "home");
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
}
