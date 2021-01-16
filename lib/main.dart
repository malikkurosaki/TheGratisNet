import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grune/controller.dart';
import 'package:get/get.dart';
import 'package:grune/views/home_view.dart';
import 'package:grune/views/menu_view.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => RootView()),
          GetPage(name: '/menu-view', page: () => MenuView())
        ],
      ),
    );
  }
}

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Controller());
  }

}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("grune"),
      ),
    );
  }
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: HomeView()
      )
    );
  }
}

class MainControll extends Controller{
  static final sudahSplash = false.obs;

  static nyeplash()async{
    if(!sudahSplash.value){
      print("splash");
      await Future.delayed(Duration(seconds: 2));
      sudahSplash.value = true;
    }
    
  }
}