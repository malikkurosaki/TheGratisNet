import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grune/components/bawah_slide.dart';
import 'package:grune/components/footer.dart';
import 'package:grune/components/my_appbar.dart';
import 'package:grune/components/pilihan.dart';
import 'package:grune/components/section_atas_footer.dart';
import 'package:grune/components/slide_text.dart';
import 'package:grune/controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeCtrl.kunciScaffold,
      drawer: MyDrawer(),
      body: Column(
        children: [
          MyAppBar(),
          Flexible(
            child: ListView(
              children: [
                SlideText(),
                BawahSlide(),
                SizedBox(
                  height: 100,
                ),
                Pilihan(),
                SectionAtasFooter(),
                Footer()
              ],
            )
          )
        ],
      ),
    );
  }
}

class HomeCtrl extends Controller{
  static final kunciScaffold = GlobalKey<ScaffoldState>();
}