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

  Container getHomeContainer(HomeModel model, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: model.themeDark ? black : primary,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image(
                        image: model.themeDark
                            ? AssetImage('assets/images/logo-dark.png')
                            : AssetImage('assets/images/logo.png'),
                        width: 120,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 0,
                  child: InkWell(
                    child: Icon(
                      model.themeDark ? Icons.light_mode : Icons.dark_mode,
                      size: 25,
                      color: model.themeDark ? grey : green,
                    ),
                    onTap: () {
                      if (model.themeDark == false) {
                        model.setTheme('dark');
                      } else {
                        model.setTheme('light');
                      }
                    },
                  ),
                )
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Tasbeeh Counter',
                  style: TextStyle(
                    fontSize: model.width(context) * 0.1,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Carattere-Regular',
                    letterSpacing: 2,
                    color: model.themeDark ? grey : green,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: MainButton(
                title: 'After Salah',
                bg: model.themeDark
                    ? 'assets/images/counter-bg-dark.png'
                    : 'assets/images/counter-bg.png',
                onClick: () async {
                  // model.setState(ViewState.busy);
                  model.resetCounter();
                  model.setMode('prayer');
                  model.setDhikrId(0);
                  model.gotoPage(context, CounterScreen());
                  model.setState(ViewState.retrieved);
                },
                model: model,
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: MainButton(
                    title: 'Dhikr',
                    bg: model.themeDark
                        ? 'assets/images/dhikr-bg-dark.png'
                        : 'assets/images/dhikr-bg.png',
                    onClick: () {
                      model.gotoPage(context, DhikrScreen());
                    },
                    model: model,
                  ),),
                  SizedBox(width: 20),
                  Expanded(
                    child: MainButton(
                      title: 'Records',
                      bg: model.themeDark
                          ? 'assets/images/reminder-bg-dark.png'
                          : 'assets/images/reminder-bg.png',
                      onClick: () {
                        model.gotoPage(context, RecordsScreen());
                      },
                      model: model,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      children: [
                        Text(
                          'For Corrections or Suggestions',
                          style: TextStyle(
                            color: model.themeDark ? grey : green,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'Contact The Developer: kamalaminu94@gmail.com',
                          style: TextStyle(
                            color: model.themeDark ? grey : green,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
