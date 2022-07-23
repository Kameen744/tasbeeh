import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tasbeeh/scoped_models/counter_model.dart';
import 'package:tasbeeh/screens/base_screen.dart';
import 'package:tasbeeh/widgets/alert_dialog.dart';
import 'package:tasbeeh/widgets/colors.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<CounterModel>(
      builder: (context, child, model) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            color: model.themeDark ? black : primary,
            child: Column(
              children: [
                Container(
                  width: model.width(context),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: model.themeDark ? grey : green,
                        ),
                        onTap: () {
                          model.gotoBack(context);
                        },
                      ),
                      if (model.mode != 'prayer')
                        InkWell(
                          onTap: () {
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
                          child: Icon(
                            Icons.save_outlined,
                            size: 24,
                            color: model.themeDark ? grey : green,
                          ),
                        )
                      else
                        SizedBox(width: 24),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(),
                    Positioned(
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 60),
                          child: Image(
                            height: model.dhikrId < 4
                                ? model.hPercent(context, 12)
                                : model.hPercent(context, 10),
                            image:
                                AssetImage(model.dhikrs[model.dhikrId].image),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: model.hPercent(context, 3),
                      // left: model.wPercent(context, 25),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            model.dhikrs[model.dhikrId].title,
                            style: TextStyle(
                              fontSize: model.dhikrId < 4
                                  ? model.hPercent(context, 4)
                                  : model.hPercent(context, 2),
                              fontWeight: FontWeight.bold,
                              color: green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: model.hPercent(context, 40),
                          width: model.width(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70),
                            ),
                            image: DecorationImage(
                              image: model.themeDark
                                  ? AssetImage(
                                      'assets/images/counter-bottom-bg-dark.png')
                                  : AssetImage(
                                      'assets/images/counter-bottom-bg.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
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
                            size: model.width(context) - 50,
                            customWidths: CustomSliderWidths(
                              progressBarWidth: 10,
                              trackWidth: 5,
                            ),
                            customColors: CustomSliderColors(
                              trackColor: model.themeDark ? green : countLine,
                              dotColor: primary,
                              progressBarColors: model.themeDark
                                  ? [black, grey]
                                  : [grey, green],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: model.hPercent(context, 5),
                            bottom: model.hPercent(context, 10),
                            left: model.wPercent(context, 15),
                            right: model.wPercent(context, 15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: model.themeDark
                                    ? AssetImage(
                                        'assets/images/counter-dark.png')
                                    : AssetImage('assets/images/counter.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Container(
                                    // color: Colors.red,
                                    ),
                                Positioned(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: model.hPercent(context, 25,),),
                                    child: Center(
                                      child: Text(
                                        model.counted.toString(),
                                        style: TextStyle(
                                          color:
                                              model.themeDark ? black : green,
                                          fontSize: model.wPercent(context, 7),
                                          fontFamily: 'Open-Display',
                                          letterSpacing: 1.7,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: model.hPercent(context, 16,),),
                                    child: Center(
                                      child: Text(
                                        model.arabicNumber
                                            .convert(model.counted,),
                                        style: TextStyle(
                                          color:
                                              model.themeDark ? green : primary,
                                          fontSize: model.wPercent(context, 6),
                                          fontFamily: 'Open-Display',
                                          letterSpacing: 1.7,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Positioned(child: Container(
                                //   alignment: AlignmentDirectional.topEnd,
                                //   padding: EdgeInsets.only(top: 80 , right: 55),
                                //   child: Text(model.arabicNumber.convert(99999999),
                                //     style: TextStyle(fontSize: 30, color: model.themeDark ? black : green,),
                                //   ),
                                //
                                // )),
                                Positioned(
                                    child: Container(
                                  padding: EdgeInsets.only(left: model.wPercent(context, 42),),
                                  child: Center(
                                    child: Container(
                                      // height: model.hPercent(context, 20),
                                      width: model.wPercent(context, 10),
                                      child: FittedBox(
                                        child: FloatingActionButton(
                                          backgroundColor: model.themeDark
                                              ? black
                                              : countLine,
                                          onPressed: () {
                                            model.resetCounter();
                                          },
                                          child: Icon(
                                            Icons.wifi_protected_setup_outlined,
                                            color:
                                                model.themeDark ? black : green,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                                Positioned(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(bottom: 0, top: model.hPercent(context, 22),),
                                    child: Center(
                                      child: Container(
                                        // height: model.hPercent(context, 20),
                                        width: model.wPercent(context, 40),
                                        child: FittedBox(
                                          child: FloatingActionButton(
                                            backgroundColor: model.themeDark
                                                ? black
                                                : countLine,
                                            onPressed: () {
                                              model.incrementCounter();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
