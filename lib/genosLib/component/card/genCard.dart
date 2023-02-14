import 'package:bunda_yuni_app/genosLib/component/JustHelper.dart';
import 'package:bunda_yuni_app/genosLib/component/request.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../genText.dart';
import '../badges/badges.dart';
import '../etc/genDimen.dart';
import '../etc/genRow.dart';
import '../etc/genShadow.dart';

class GenCard extends StatelessWidget {
  final double radius;
  final double? shadowRadius;
  final double? height;
  final double width;
  final Color backGroundColor;
  final Color? shadowColor;
  final double? shadowOffset;
  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function()? ontap;

  GenCard(
      {this.ontap,
      this.radius = 10,
      this.height = double.infinity - 20,
      this.shadowRadius,
      this.width = 250,
      this.backGroundColor = Colors.white,
      this.shadowColor,
      this.shadowOffset,
      this.child,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap == null ? () {} : ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backGroundColor,
            boxShadow: GenShadow()
                .genShadow(color: shadowColor, radius: shadowRadius)),
        margin: margin,
        padding: padding,
        width: width,
        child: child,
      ),
    );
  }
}

class GenCardVertical extends StatelessWidget {
  final String gambar;
  final String judul;
  final String kota;
  final String tanggal;
  final Function ontap;

  GenCardVertical(
    this.ontap, {
    this.gambar =
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    this.judul = "-",
    this.kota = "-",
    this.tanggal = "-",
  });

  @override
  Widget build(BuildContext context) {
    return GenCard(
        ontap: () {},
        margin: EdgeInsets.only(
            left: GenDimen.cardMargin, right: GenDimen.cardMargin, bottom: 5),
        width: 180,
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              gambar,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenText(judul,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  RowSpaceBetween(
                      paddingHorz: 0,
                      chilidLeft: GenText(kota,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 10)),
                      childRight: GenText(tanggal,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 10))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ]));
  }
}

class GenCardMenu extends StatelessWidget {
  final String gambar;
  final String judul;
  final String isi;
  final String harga;
  final String harga1;
  final Function()? ontap;
  final String? badges;

  GenCardMenu({
    this.ontap,
    this.gambar =
        "https://bodybigsize.com/wp-content/uploads/2020/02/noimage-8.png",
    this.judul = "-",
    this.isi = "-",
    this.harga1 = "-",
    this.harga = "-",
    this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return GenCard(
      ontap: ontap ?? () {},
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          horizontal: GenDimen.cardMargin, vertical: GenDimen.cardMargin),
      child: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                gambar,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: GenDimen.afterTitle,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                        ),
                        Row(
                          children: [
                            GenText(judul,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(
                              width: 5,
                            ),
                            badges == null
                                ? Container()
                                : Badgesred(
                                    text: badges.toString(),
                                  )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        GenText(isi,
                            maxLines: 3,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                    GenText(harga,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenTransaksi extends StatelessWidget {
  final String judul;
  final String isi;
  final String harga;
  final Function()? ontap;
  final String? badges;

  GenTransaksi({
    this.ontap,
    this.judul = "-",
    this.isi = "-",
    this.harga = "-",
    this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return GenCard(
      ontap: ontap ?? () {},
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          horizontal: GenDimen.cardMargin, vertical: GenDimen.cardMargin),
      child: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                        ),
                        Row(
                          children: [
                            GenText(judul,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(
                              width: 5,
                            ),
                            badges == null
                                ? Container()
                                : Badgesred(
                                    text: "4",
                                  )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        GenText(isi,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                    GenText(harga,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenCardOrder extends StatelessWidget {
  final String nomor;
  final List? isi;
  final int total;
  final int? stat;
  final int? statpem;
  final String? tanggal;
  final String? nama;
  final String? tanggal_pengiriman;
  final Function()? ontap;
  final String? badges;

  GenCardOrder({
    this.ontap,
    this.nomor = "-",
    this.isi,
    this.stat,
    this.statpem,
    this.total = 0,
    this.tanggal,
    this.tanggal_pengiriman,
    this.nama,
    this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return GenCard(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
            horizontal: GenDimen.cardMargin, vertical: GenDimen.cardMargin),
        child: Container(
          width: double.infinity,
          child: Row(children: [

            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GenText(nomor == null ? "No. Trans : -" : "No. Trans : "+nomor,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              GenText(status(stat, statpem),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green  )),
                            ],
                          ),

                          GenText("Tanggal Pengiriman: "+tanggal_pengiriman!.substring(0, 10),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          GenText(
                              tanggal == null
                                  ? "Tanggal order: -"
                                  : "Tanggal order: "+formatTanggalFromStringGMT(tanggal!),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(
                            height: 20,
                          ),
                          GenText(formatRupiahUseprefik(total),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange)),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                              children: isi == null
                                  ? [
                                      Container(
                                        child: Center(
                                          child: GenText("kosong"),
                                        ),
                                      )
                                    ]
                                  : isi!.map<Widget>((e) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  ip + e["barangs"]["image"],
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: GenDimen.afterTitle,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GenText(
                                                      e["barangs"]["nama"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GenText(e["qty"].toString()),
                                                        GenText(
                                                            e["total"] == null ? "Rp -" :  formatRupiahUseprefik(e["total"]),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          stat == 0 ? Container() : statpem == 0 ?
                                          TextButton(onPressed: ontap, child: Container(width: double.infinity ,padding: EdgeInsets.all(20),decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.blue
                                          ),child: Center(child: GenText("Upload Pembayaran ", style: TextStyle(color: Colors.white),))))
                                              : Container()

                                        ],
                                      );
                                    }).toList())
                        ],
                      )
                    ]),
              ),
            ),
          ]),
        ));
  }
}
