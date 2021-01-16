import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grune/controller.dart';
import 'package:get/get.dart';

class SlideText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: 10,
            onPageChanged: (value) => SlideTextCtrl.onPageSlide(value),
            itemBuilder: (context, index) => 
            Center(
              child: Card(
                color: index % 2 == 0?Colors.grey[300]:Colors.grey[400],
                child: Container(
                  height: 300,
                  width: 500,
                  child: Center(
                    child: Text("これはスライドショーです $index",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              )
            ),
          ),
          Slideindicator()
        ],
      ),
    );
  }
}

class Slideindicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) => 
            Card(
              color: SlideTextCtrl.indicator.value == index?Colors.white:Colors.grey[600],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 10,
                width: 10,
              ),
            )
          ),
        ),
      )
    );
  }
}

class SlideTextCtrl extends Controller{
  static final indicator = 0.obs;

  static onPageSlide(int index){
    indicator.value = index;
  }
}