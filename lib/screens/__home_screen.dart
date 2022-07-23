import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasbeeh/enums/view_state.dart';
import 'package:tasbeeh/scoped_models/home_model.dart';
import 'package:tasbeeh/screens/base_screen.dart';
import 'package:tasbeeh/screens/counter_screen.dart';
import 'package:tasbeeh/screens/dhikr_screen.dart';
import 'package:tasbeeh/screens/records_screen.dart';
import 'package:tasbeeh/widgets/colors.dart';
import 'package:tasbeeh/widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeModel>(
      builder: (context, child, model) => Scaffold(
        body: model.state == ViewState.loadinApp
            ? getSplashContainer(model, context)
            : getHomeContainer(model, context),
      ),
    );
  }

  Widget getHomeContainer(HomeModel model, BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          color: primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
                        height: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: Text('col-3'),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
                        height: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: Text('col-3'),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
                        height: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: Text('col-3'),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
                        height: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: Text('col-3'),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: model.width(context) * 0.37,
                      height: model.height(context) * 0.19,
                      decoration: BoxDecoration(
                          color: primary,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(image: model.themeDark
                            ? AssetImage('assets/images/logo-dark.png')
                            : AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
                      ),
                    )
                  ],
                )),
                Expanded(
                    flex: 2,
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(50),
                      width: model.width(context) * 0.7,
                      height: model.height(context) * 0.3,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    )
                ],)),
              ],
            ),
        ),
      ],
    ));
  }
}

Container getSplashContainer(HomeModel model, BuildContext context) {
  return Container(
    color: model.themeDark ? black : primary,
    child: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 120, bottom: 10),
        child: Image(
          width: 180,
          height: 180,
          image: model.themeDark
              ? AssetImage('assets/images/logo-dark.png')
              : AssetImage('assets/images/logo.png'),
        ),
      ),
    ),
  );
}
