import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tasbeeh/scoped_models/counter_model.dart';
import 'package:tasbeeh/screens/base_screen.dart';
import 'package:tasbeeh/screens/records_screen.dart';
import 'package:tasbeeh/widgets/alert_dialog.dart';
import 'package:tasbeeh/widgets/colors.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseScreen<CounterModel>(
      builder: (context, child, model) => Scaffold(
        body: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          color: model.themeDark ? black : green,
                          child: SafeArea(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 24,
                                          color:
                                              model.themeDark ? grey : primary,
                                        ),
                                      ),
                                      onTap: () {
                                        model.gotoBack(context);
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: Text(
                                          'Tasbeeh Counter',
                                          style: TextStyle(
                                            fontSize:
                                                model.width(context) * 0.06,
                                            fontFamily:
                                                'GentiumBookBasic-Regular',
                                            // 'Carattere-Regular'
                                            color: model.themeDark
                                                ? grey
                                                : primary,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 20,
                                          ),
                                          child: Icon(
                                            model.sound
                                                ? Icons.volume_up
                                                : Icons.volume_off,
                                            size: 24,
                                            color: model.themeDark
                                                ? grey
                                                : primary,
                                          ),
                                        ),
                                        onTap: () {
                                          model.soundOn();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // constraints: BoxConstraints.expand(),
                          height: model.height(context) * 0.35,
                          margin: EdgeInsets.only(
                            top: model.height(context) * 0.1,
                            bottom: model.height(context) * 0.04,
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            color: model.themeDark
                                ? grey.withOpacity(0.2)
                                : lightGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      model.dhikrs[model.dhikrId].title,
                                      style: TextStyle(
                                        fontSize: model.dhikrId < 4
                                            ? model.height(context) * 0.03
                                            : model.height(context) * 0.015,
                                        fontWeight: FontWeight.bold,
                                        color: green,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 10,
                                        top: 20,
                                      ),
                                      child: Image(
                                        height: model.dhikrId < 4
                                            ? model.height(context) * 0.06
                                            : model.height(context) * 0.04,
                                        image: AssetImage(
                                            model.dhikrs[model.dhikrId].image),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      model.counted.toString(),
                                      style: TextStyle(
                                        fontSize: model.height(context) * 0.04,
                                        fontWeight: FontWeight.bold,
                                        color: model.themeDark ? grey : primary,
                                      ),
                                    ),
                                    Text(
                                      model.arabicNumber.convert(model.counted),
                                      style: TextStyle(
                                        fontSize: model.height(context) * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: model.themeDark ? grey : primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: model.height(context) * 0.145,
                          width: model.width(context) * 0.6,
                          decoration: BoxDecoration(
                            color: model.themeDark ? black : green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(150),
                              topRight: Radius.circular(150),
                            ),
                          ),
                        ),
                        Container(
                          height: model.height(context) * 0.133,
                          width: model.width(context) * 0.545,
                          decoration: BoxDecoration(
                            color: model.themeDark ? grey : primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(150),
                              topRight: Radius.circular(150),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          color: model.themeDark ? grey : primary,
                        ),
                        Container(
                          constraints: BoxConstraints.expand(),
                          // height: model.height(context) * 0.35,
                          margin: EdgeInsets.only(
                            top: model.height(context) * 0.05,
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            color: model.themeDark ? grey : primary,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  counterButton(
                                    model: model,
                                    context: context,
                                    bText: 'Back',
                                    mRight: 5,
                                    mLeft: 0,
                                    mTop: 0,
                                    clicked: () {
                                      model.decreamentCounter();
                                    },
                                    icon: Icons.arrow_back_ios,
                                  ),
                                  counterButton(
                                    model: model,
                                    context: context,
                                    bText: 'Reset',
                                    mRight: 0,
                                    mLeft: 5,
                                    mTop: 0,
                                    clicked: () {
                                      showAlertDialog(
                                        context: context,
                                        msg: 'Delete the current count?',
                                        model: model,
                                        yes: () {
                                          model.resetCounter();
                                          showSnackBar(
                                            context: context,
                                            message: 'Deleted successfully!',
                                            model: model,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        no: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                    icon: Icons.refresh,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  counterButton(
                                    model: model,
                                    context: context,
                                    bText: 'Save',
                                    mRight: 5,
                                    mLeft: 5,
                                    mTop: 10,
                                    clicked: () {
                                      showAlertDialog(
                                        context: context,
                                        msg: 'Save the current count?',
                                        model: model,
                                        yes: () {
                                          model.saveCounts();
                                          showSnackBar(
                                            context: context,
                                            message: 'Saved successfully!',
                                            model: model,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        no: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                    icon: Icons.save_alt,
                                  ),
                                  counterButton(
                                    model: model,
                                    context: context,
                                    bText: 'Saved Dhikr',
                                    mRight: 0,
                                    mLeft: 5,
                                    mTop: 10,
                                    clicked: () {
                                      model.gotoPage(context, RecordsScreen());
                                      // model.flutterLocalNotificationsPlugin.show(
                                      //   0,
                                      //   'notification with theme sound',
                                      //   null,
                                      //   model.platformChannelSpecifics,
                                      // );
                                    },
                                    icon: Icons.list_alt,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: model.height(context) * 0.145,
                          width: model.width(context) * 0.545,
                          decoration: BoxDecoration(
                            color: model.themeDark ? grey : primary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment(0, 0.3),
                  child: Container(
                      child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        child: SleekCircularSlider(
                          min: 0,
                          max: model.maxCounted,
                          initialValue: model.counted.toDouble(),
                          appearance: CircularSliderAppearance(
                            infoProperties: InfoProperties(
                              mainLabelStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                            ),
                            size: model.width(context) * 0.53,
                            customWidths: CustomSliderWidths(
                              progressBarWidth: 10,
                              trackWidth: 5,
                            ),
                            customColors: CustomSliderColors(
                              trackColor: model.themeDark ? grey : primary,
                              dotColor: primary,
                              progressBarColors: model.themeDark
                                  ? [black, grey]
                                  : [lightGreen, lightGreen],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.3,
                        // height: model.hPercent(context, 20),
                        // width: model.wPercent(context, 40),
                        child: FittedBox(
                          child: FloatingActionButton(
                            enableFeedback: false,
                            child: Center(
                              child: Text(
                                'Count',
                                style: TextStyle(
                                  fontSize: model.width(context) * 0.02,
                                  color: model.themeDark ? grey : primary,
                                ),
                              ),
                            ),
                            backgroundColor: model.themeDark ? black : green,
                            onPressed: () {
                              model.incrementCounter();
                            },
                          ),
                        ),
                      ),
                    ],
                  ))),
              // Container(),
              // Container(
              //   height: 100,
              //   width: 200,
              //   decoration: BoxDecoration(
              //     color: Colors.lightGreen,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(100),
              //       topRight: Radius.circular(100),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   child: Container(
              //     margin: EdgeInsets.only(top: 100, bottom: 50, left: 50, right: 50,),
              //     decoration: BoxDecoration(
              //       color: Colors.yellow,
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment(0, 0.5),
              //   child: Container(
              //     width:  model.width(context) * 0.9,
              //     height: model.height(context) * 0.4,
              //     child: Card(
              //       elevation: 12,
              //       child: Center(child: Text('CARD', style: Theme.of(context).textTheme.headline2)),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget counterButton({
    required CounterModel model,
    required BuildContext context,
    required double mRight,
    required double mLeft,
    required double mTop,
    required String bText,
    required icon,
    required clicked,
  }) {
    return Expanded(
      child: InkWell(
        onTap: clicked,
        enableFeedback: model.sound,
        child: Container(
          height: model.height(context) * 0.15,
          margin: EdgeInsets.only(
            right: mRight,
            left: mLeft,
            top: mTop,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: model.themeDark
                ? grey.withOpacity(0.2)
                : lightGreen.withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                color: model.themeDark ? black : green,
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: model.themeDark ? grey : primary,
              ),
              Text(
                bText,
                style: TextStyle(
                  fontSize: 15,
                  color: model.themeDark ? grey : primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
