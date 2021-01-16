import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grune/controller.dart';
import 'package:grune/views/home_view.dart';
import 'package:grune/views/menu_view.dart';
import 'package:grune/warna.dart';


class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      color: Colors.blueGrey,
      child: GetPlatform.isMobile?MyAppBarMobile():MyAppBarWeb(),
    );
  }
}

class MyAppBarWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("GRUNE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("どこに行くの".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.white,
                      ), 
                      onPressed: () => Get.to(MenuView(menuText: "どこに行くの",))
                    )
                  ],
                ),
                Wrap(
                  children: List.generate(MyAppBarCtrl.lsMenu.length, (index) => 
                    FlatButton(
                      onPressed: () => Get.to(MenuView(menuText: MyAppBarCtrl.lsMenu[index],)), 
                      child: Text(MyAppBarCtrl.lsMenu[index].toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu), 
            onPressed: () => HomeCtrl.kunciScaffold.currentState.openDrawer()
          ),
          Center(
            child: Text("Grune",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey
            ),
            child: Column(
              children: [
                Text("Drawer")
              ],
            )
          ),
          Column(
            children: List.generate(MyAppBarCtrl.lsMenu.length, (index) => 
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text(MyAppBarCtrl.lsMenu[index]),
                onTap: (){
                  Get.back();
                  Get.to(MenuView(menuText: MyAppBarCtrl.lsMenu[index],));
                },
              )
            ),
          )
        ],
      ),
    );
  }
}

class MyAppBarCtrl extends Controller{
  static final lsMenu = ["home", "ランチ", "ランチ", "食べていない", "飢えている", "食べて良い"];

  static kemana(){

  }

  static menuClick(int index){

  }
}