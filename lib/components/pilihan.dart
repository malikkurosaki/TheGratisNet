import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grune/components/bawah_slide.dart';
import 'package:grune/controller.dart';
import 'package:get/get.dart';
import 'package:grune/views/order_view.dart';

class Pilihan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          PilihanKiri(),
          PilihanKanan()
        ],
      ),
    );
  }
}

class PilihanKiri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[50],
      child: Container(
        padding: EdgeInsets.all(8),
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("ini judul kiri",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey
                ),
              )
            ),
            GetX(
              initState: (state) => PilihanCtrl.init(),
              builder: (controller) => Container(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  crossAxisCount: GetPlatform.isMobile?2:3,
                  children: List.generate(PilihanCtrl.lsMobil.length, (index) => 
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(8),
                              child: Image.network(PilihanCtrl.lsMobil[index]["gambar"],
                                loadingBuilder: (context, child, loadingProgress) => PilihanCtrl.handleLoadingImage(child, loadingProgress),
                              )
                            )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(PilihanCtrl.lsMobil[index]["nama"])
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Checkbox(
                                  value: PilihanCtrl.lsMobil[index]["dipilih"], 
                                  onChanged: (value) => PilihanCtrl.handelPilihan(index, value)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ).toList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("keterangan dibawahnya",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey
                ),
              ),
            ),
            Obx( () =>
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("pilihan 1",),
                          OutlineButton(
                            onPressed: () => PilihanCtrl.handelPopList1(),
                            child: Row(
                              children: [
                                Text(PilihanCtrl.hint1.value,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down,
                                  color: Colors.blue[800],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx( () => 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(PilihanCtrl.hint2.value),
                            OutlineButton(
                              onPressed: () => PilihanCtrl.handelPopList2(),
                              child: Row(
                                children: [
                                  Text(PilihanCtrl.hint2.value,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                    color: Colors.blue[800],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text("AT / MT"),
                  Obx( () => 
                    Container(
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () => PilihanCtrl.atmt.value = !PilihanCtrl.atmt.value,
                          child: Row(
                            mainAxisAlignment: PilihanCtrl.atmt.value? MainAxisAlignment.start: MainAxisAlignment.end,
                            children: [
                              Card(
                                color: Colors.blue[200],
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 40,
                                  padding: EdgeInsets.all(8),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () => PilihanCtrl.handelmeneruskan(),
                child: Card(
                  color: Colors.blue[200],
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("saya ingin melanjutkan",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final lsPilihMobil = List.generate(9, (index) => 
  {
    "nama": "nama mobil $index",
    "dipilih": false,
    "gambar": "https://www.freepnglogos.com/uploads/car-png/car-transparent-png-pictures-icons-and-png-backgrounds-6.png"
  }
);

class Hint1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500
        ),
        child: DraggableScrollableSheet(
          builder: (context, scrollController) => Card(
            child: ListView(
              controller: scrollController,
              children: List.generate(20, (index) => 
                ListTile(
                  title: Text("silahkan pilih hint 1 - $index"),
                  onTap: () {
                    PilihanCtrl.hint1.value = "hasil hint 1 - $index";
                    Get.back();
                  },
                )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Hint2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500
        ),
        child: DraggableScrollableSheet(
          builder: (context, scrollController) => Card(
            child: ListView(
              controller: scrollController,
              children: List.generate(20, (index) => 
                ListTile(
                  title: Text("silahkan pilih hint 2 - $index"),
                  onTap: () {
                    PilihanCtrl.hint2.value = "hasil hint 2 - $index";
                    Get.back();
                  },
                )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}


/// pilihan bagian kanan
class PilihanKanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.all(8),
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("atasnya",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey
                  ),
                ),

                // pilihan dropdown 3 dan 4
                Obx( () => 
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("pilihan 3  "),
                            OutlineButton(
                              onPressed: () => PilihanCtrl.handelPilihan3(),
                              child: Row(
                                children: [
                                  Text(PilihanCtrl.hint3.value,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("pilihan 4  "),
                            OutlineButton(
                              onPressed: () => PilihanCtrl.handelPilihan4(),
                              child: Row(
                                children: [
                                  Text(PilihanCtrl.hint4.value,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            )
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
                GetX(
                  initState: (state) => PilihanCtrl.initMobilKanan(),
                  builder: (controller) => 
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(8),
                    color: Colors.grey[200],
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: List.generate(PilihanCtrl.lsMobilKanan.length, (index) => PilihanCtrl.lsMobilKanan.isEmpty? Text("loading .."):
                        Container(
                          width: 200,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  color: Colors.white,
                                  margin: EdgeInsets.only(right: 8),
                                  child: Image.network(PilihanCtrl.lsMobilKanan[index]['gambar'],
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if(loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(PilihanCtrl.lsMobilKanan[index]['nama']),
                                  Checkbox(
                                    value: PilihanCtrl.lsMobilKanan[index]['dipilih'], 
                                    onChanged: (value) {
                                      PilihanCtrl.lsMobilKanan[index]['dipilih'] = !PilihanCtrl.lsMobilKanan[index]['dipilih'];
                                      PilihanCtrl.lsMobilKanan.refresh();
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ).toList(),
                    ),
                  ),
                ),
                // dibawah list 3 mobil
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text("coba pilih jenisnya",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey
                    ),
                  ),
                ),
                Obx( () => 
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text("warna apa   "),
                        OutlineButton(
                          onPressed: () => PilihanCtrl.handelpilihWarna(),
                          child: Row(
                            children: [
                              Text(PilihanCtrl.hintWarna.value,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey
                                ),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text("AT / MT   "),
                      Obx( () =>
                        InkWell(
                          onTap: () => PilihanCtrl.atmtKanan.value = !PilihanCtrl.atmtKanan.value,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              alignment: PilihanCtrl.atmtKanan.value? Alignment.centerLeft: Alignment.centerRight,
                              width: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                color: Colors.blue[200],
                                child: Container(
                                  width: 30,
                                  padding: EdgeInsets.all(8),
                                ),
                              ),
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => PilihanCtrl.handelPenerusanKanan(),
                    child: Card(
                      color: Colors.blue[200],
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("saya ingin melanjutkan   ",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(8),
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Permintaan",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey
                  ),
                ),
                Center(
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: PilihanCtrl.permintaanController,
                      decoration: InputDecoration(
                        labelText: "rg : with self driving",
                        border: OutlineInputBorder(),
                        isDense: true
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () => PilihanCtrl.handelPermintaan(),
                    child: Card(
                      color: Colors.blue[200],
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("update request",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


final listMobilkanan = List.generate(3, (index) => 
  {
    "nama": "mobil $index",
    "gambar": "https://webstockreview.net/images/car-png-images-1.png",
    "dipilih": false
  }
);


class Hint3dan4 extends StatelessWidget {
  final titel;
  final hint;
  const Hint3dan4({Key key, this.titel, this.hint}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500
        ),
        child: DraggableScrollableSheet(
          expand: true,
          builder: (context, scrollController) => Card(
            child: ListView(
              controller: scrollController,
              children: List.generate(20, (index) => 
                ListTile(
                  title: Text("$titel $index"),
                  onTap: () {
                    if(hint == 3){
                      PilihanCtrl.hint3.value = "hasil hint 3 - $index";
                    }else{
                      PilihanCtrl.hint4.value = "hasil hint 4 - $index";
                    }
                    Get.back();
                  },
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PilihanWarna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
        child: DraggableScrollableSheet(
          builder: (context, scrollController) => Card(
            child: ListView(
              controller: scrollController,
              children: List.generate(20, (index) => 
                ListTile(
                  title: Text("pilihan warna $index"),
                  onTap: () {
                    PilihanCtrl.hintWarna.value = "hasil warna $index ";
                    Get.back();
                  },
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// controller
class PilihanCtrl extends Controller{
  static final lsMobil = [].obs;
  static final hint1 = "hint 1".obs;
  static final hint2 = "hint 2".obs;
  static final hint3 = "hint 3".obs;
  static final hint4 = "hint 4".obs;
  static final hintWarna = "pilih warna".obs;
  static final atmt = false.obs;
  static final atmtKanan = false.obs;
  static final lsMobilKanan = [].obs;
  static final permintaanController = TextEditingController();

  static init()async{
    lsMobil.assignAll(lsPilihMobil);
  }

  static initMobilKanan(){
    lsMobilKanan.assignAll(listMobilkanan);
  }

  static handleLoadingImage(Widget child, ImageChunkEvent loadingProgress ){
    if(loadingProgress == null) return child;
    return Center(child: CircularProgressIndicator(strokeWidth: 1,),);
  }

  static handelPilihan(int index, bool value){
    
    lsMobil[index]['dipilih'] = !lsMobil[index]['dipilih'];
    lsMobil.refresh();
  }

  static handelPopList1(){
    Get.bottomSheet(Hint1());
  }

  static handelPopList2(){
    Get.bottomSheet(Hint2());
  }

  static handelmeneruskan(){

    if(lsMobil.where((e) => e['dipilih']).toList().isEmpty){
      Get.snackbar("info", "please choose one of car");
      return;
    }
    final paket = {
      "hint1": hint1.value,
      "hint2": hint2.value,
      "listMobil": lsMobil.where((e) => e['dipilih']).toList(),
      "atmt": atmt.value
    };

    Get.to(OrderView(lsOrder: paket,));
  }

  static handelPilihan3(){
    Get.bottomSheet(Hint3dan4(
      titel: "pilih warna ",
      hint: 3,
    ));
  }

  static handelPilihan4(){
    Get.bottomSheet(Hint3dan4(
      titel: "pilih ukuran ",
      hint: 4,
    ));
  }

  static handelpilihWarna(){
    Get.bottomSheet(PilihanWarna());
  }


  static handelPenerusanKanan(){
    final lsData = lsMobilKanan.where(( e ) => e['dipilih']).toList();
    if(lsData.isEmpty){
      Get.snackbar("info", "choose one or more car");
      return;
    }

    final paket = {
      "hiny3": hint3.value,
      "hint4": hint4.value,
      "data": lsData,
      "atmt": atmtKanan.value
    };

    Get.to(OrderView(lsOrder: paket,));
  }

  static handelPermintaan(){
    if(permintaanController.value.text.isEmpty){
      Get.snackbar("info", "write something or what");
      return;
    }
    Get.dialog(AlertDialog(
      title: Text("Request"),
      content: Text("you has order ${permintaanController.value.text}"),
    ));
  }
}
