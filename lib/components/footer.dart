import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("GRUNE",
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                  Text(
                    ''' ブログを見る \n私たちに関しては \nお問い合わせ \nキャリアについて 
                    '''
                  )
                ],
              ),
              Container(
                height: 200,
                padding: EdgeInsets.all(1),
                color: Colors.blue[200],
              ),
              Row(
                children: [
                  Text(
                    '''ソーシャルメディア \n友情 \nイベントの議題 \n放送スケジュール
                    ''',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.blue[300],
          margin: EdgeInsets.only(top: 24),
          child: Center(
            child: Text("copyright@2021 | Malik Kurosaki"),
          ),
        )
      ],
    );
  }
}