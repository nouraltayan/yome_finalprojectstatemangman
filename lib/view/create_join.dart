import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_management/core/res/app_text_style.dart';
import 'package:project_management/core/res/color_palete.dart';

late String token_acc;

class creatjoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primar,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 450,
              color: primar,
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 60,
                    child: Container(
                      width: 380,
                      height: 350,
                      decoration: BoxDecoration(
                        color: primar,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('asses/image/trangl.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 30,
                    child: Container(
                      width: 210,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('asses/image/yome.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    left: 90,
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('asses/image/text.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/signup/home/newproject');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: botto,
                    minimumSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Create', style: text1),
                ),
              ),
            ),
            Container(
                width: 290,
                height: 45,
                decoration: DottedDecoration(
                  shape: Shape.box,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: const CircleAvatar(
                        backgroundColor: botto,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('join', style: text12),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
