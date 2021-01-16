import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailmobil extends StatelessWidget {
  final nama, gambar;

  const Detailmobil({Key key, this.nama, this.gambar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text(nama),
          ),
          body: ListView(
            children: [
              Container(
                child: Image.network(gambar),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(nama,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[700]
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(keterangan,
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final keterangan = "この車は展示用だけではありません。見たい場合は大丈夫ですが、危険にさらされたくない場合は、お金があれば、それとアンプです。＃39;大丈夫です。お金がない場合は、後で問題が発生しますが、まだです。繰り返しますが、今のように少し難しいように見えますが、それは大丈夫です。お互いの能力次第です。購入したい場合は大丈夫ですが、何もないので販売していません。写真だけです。";