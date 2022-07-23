import 'package:flutter/material.dart';
import 'package:tasbeeh/models/dhikr_data_model.dart';
import 'package:tasbeeh/scoped_models/dhikr_model.dart';
import 'package:tasbeeh/screens/base_screen.dart';
import 'package:tasbeeh/screens/counter_screen.dart';
import 'package:tasbeeh/widgets/colors.dart';

class DhikrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<DhikrModel>(
      builder: (context, child, model) => Scaffold(
        body: Column(
          children: [
            Stack(
              children: [

                Container(
                  height: model.height(context),
                  color: black,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: model.width(context),
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/quran.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: grey,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: model.themeDark ? grey : primary,
                        ),
                        onTap: () {
                          model.gotoBack(context);
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: model.width(context),
                    height: model.height(context) - 200,
                    decoration: BoxDecoration(
                      color: model.themeDark ? darkGrey : primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(100, 30),
                        topRight: Radius.elliptical(100, 30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: model.width(context),
                    height: model.height(context) - 180,
                    child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        itemCount: model.dhikrs.length,
                        itemBuilder: (context, index) {
                          return dhikrCard(
                            model,
                            context,
                            model.dhikrs[index],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dhikrCard(
    DhikrModel model,
    BuildContext context,
    DhikrDataModel dhikr,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: model.width(context),
      height: 70,
      decoration: BoxDecoration(
        color: model.themeDark ? black : primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: model.themeDark ? grey : green,
            blurRadius: 5,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () async {
            model.setMode(dhikr.title);
            model.setDhikrId(dhikr.id);
            await model.gotoPage(context, CounterScreen());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    dhikr.title,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                height: 35,
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 10,
                ),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(dhikr.image),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
