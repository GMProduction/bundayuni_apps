import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../genosLib/component/button/genButton.dart';
import '../genosLib/component/genToast.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/component/request.dart';
import '../genosLib/component/textfiled/TextField.dart';
import '../genosLib/database/genPreferrence.dart';

class AkunSaya extends StatefulWidget {
  const AkunSaya({Key? key}) : super(key: key);

  @override
  State<AkunSaya> createState() => _AkunSayaState();
}

class _AkunSayaState extends State<AkunSaya> {

  var dataProfil;
  var req = new GenRequest();

  int _currentIndex = 0;
  var nama = "";
  var alamat = "";
  var no_hp = "";

  @override
  void initState() {
    // TODO: implement initState
    getProfile();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GenPage(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: nama == ""
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "PROFIL",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Image.network("https://cdn-icons-png.flaticon.com/128/3135/3135715.png"),
              SizedBox(
                height: 20,
              ),
              TextLoginField(
                initVal: nama,
                width: double.infinity,
                label: "Nama",
                keyboardType: TextInputType.name,
//                                    controller: tecNumber,
                onChanged: (val) {
                  nama = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi Nama Dengan Benar";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextLoginField(
                initVal: alamat,
                width: double.infinity,
                label: "Alamat",
                keyboardType: TextInputType.streetAddress,
//                                    controller: tecNumber,
                onChanged: (val) {
                  alamat = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi Alamat Dengan Benar";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextLoginField(
                initVal: no_hp,
                width: double.infinity,
                label: "No. HP",
                keyboardType: TextInputType.number,
//                                    controller: tecNumber,
                onChanged: (val) {
                  no_hp = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi No HP";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),

              GenButton(
                color: Colors.redAccent,
                text: "Logout",
                ontap: () {
                  deletePref();
                  toastShow("Logout", context, Colors.black);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);

                },
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),

              Divider(),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
              ),

              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }

  void getProfile() async {
    dataProfil = await req.getApi("profile");
    print("DATA $dataProfil");


    nama = dataProfil["nama"];
    alamat = dataProfil["alamat"];
    no_hp = dataProfil["no_hp"];

    setState(() {});
  }
}
