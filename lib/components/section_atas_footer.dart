import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class SectionAtasFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 700
        ),
        margin: EdgeInsets.symmetric(vertical: 42),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("update every time",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey
                    ),
                  )
                ),
                Card(
                  color: Colors.blue[200],
                  child: InkWell(
                    onTap: () => Get.snackbar("title", "you has clicked"),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 200,
                      child: Center(
                        child: Text("untuk melanjutkan",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(2),
              color: Colors.blueGrey[500],
            ),
            Container(
              child: Column(
                children: List.generate(3, (index) => 
                 Container(
                   child: Column(
                     children: [
                       ListTile(
                         title: Text("2021/01/0$index"),
                         subtitle: Text("これは非常に長いテキストで、おそらく長さ5 kmですが、そのように見えます"),
                         trailing: IconButton(
                           onPressed: () => Get.snackbar("info", "you are has click"),
                           icon: Icon(Icons.arrow_forward_ios),
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.all(1),
                         color: Colors.blueGrey,
                       )
                     ],
                   ),
                 )
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}