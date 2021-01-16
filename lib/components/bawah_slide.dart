import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grune/controller.dart';
import 'package:grune/views/detail_mobil_view.dart';

class BawahSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 36),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text("工場からの新車は暖かい",
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                ),
                Text("お腹が空いたら食べたくなる",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
                Text("揚げ米や揚げ鶏を食べるのは良さそうです",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                )
              ],
            ),
          ),
          ListMobil()
        ],
      ),
    );
  }
}

class ListMobil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 300,
      child: GetX(
        initState: (state) => ListMobilCtrl.init(),
        builder: (controller) => ListMobilCtrl.lsMobil.isEmpty? Center(child: Text("loading ..."),):
        ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(ListMobilCtrl.lsMobil.length, (index) => 
            Center(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          child: Image.network(lsProduk[index]['gambar'],
                            loadingBuilder: (context, child, loadingProgress) => ListMobilCtrl.loadingGambar(child, loadingProgress),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lsProduk[index]['nama']),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("これはピンです"),
                              IconButton(
                                icon: Icon(Icons.push_pin,
                                  color: lsProduk[index]['tag']?Colors.yellow:Colors.grey,
                                ), 
                                onPressed: ()=> ListMobilCtrl.handlepin(index)
                              )
                            ],
                          ),
                        ],
                      ),
                      // tombol ke detail
                      OutlineButton(
                        onPressed: () => Get.to(Detailmobil(nama: lsProduk[index]['nama'], gambar: lsProduk[index]['gambar'],)), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("もっと詳しく知る",
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
            )
          ),
        ),
      )
    );
  }
}


/// pilihan produk 
/// checklist
List lsProduk = List.generate(20, (index) => 
  {
    "nama": "これは車の名前です",
    "gambar": "https://freepngimg.com/thumb/car/4-2-car-png-hd.png",
    "tag": false
  }
);


/// controller
/// 
class ListMobilCtrl extends Controller{
  static final lsMobil = [].obs;

  // init load saaat awal
  static init()async{
    lsMobil.assignAll(lsProduk);
  }

  static handlepin(int index){
    lsMobil[index]['tag'] = !lsMobil[index]['tag'];
    lsMobil.refresh();
  }

  static loadingGambar(Widget child, ImageChunkEvent loadingProgress){
    if(loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(strokeWidth: 1,),
    );
  }
}