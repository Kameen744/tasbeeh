import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tasbeeh/scoped_models/records_model.dart';
import 'package:tasbeeh/widgets/colors.dart';

import 'base_screen.dart';

class RecordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<RecordsModel>(
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
                    child: FutureBuilder(
                      future: model.getRecords(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20,
                              ),
                              itemCount: model.records.length,
                              itemBuilder: (context, index) {
                                return dhikrCard(
                                  model,
                                  context,
                                  model.records[index],
                                );
                              });
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
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
    RecordsModel model,
    BuildContext context,
    dhikr,
  ) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: model.width(context),
          height: 100,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'Counts: ${dhikr['counted']} - ${model.arabicNumber.convert(dhikr['counted'])}',
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: green,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            formatDate(date: dhikr['createdAt']),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: green,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        width: 140,
                        margin: EdgeInsets.only(
                          top: 30,
                          right: 10,
                        ),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(dhikr['image']),
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                          top: 5,
                          right: 10,
                        ),
                        child: Text(
                          toHijri(date: dhikr['createdAt']),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: green,
                            fontSize: 10,
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
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            dhikr['title'],
            softWrap: true,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 3,
          right: 0,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              underline: SizedBox(),
              style: TextStyle(
                fontSize: 13,
                letterSpacing: 1.1,
              ),
              dropdownColor: Colors.transparent,
              icon: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: model.themeDark ? grey : green,
                    )),
                child: Center(
                  child: Icon(
                    Icons.menu_sharp,
                    color: model.themeDark ? grey : green,
                    size: 18,
                  ),
                ),
              ),
              onChanged: (newValue) {
                if (newValue == 'Continue') {
                  model.resumeCount(
                    id: dhikr['id'],
                    title: dhikr['title'],
                    prevCount: dhikr['counted'],
                    context: context,
                  );
                } else if (newValue == 'Delete') {
                  model.deleteRecord(dhikr['id']);
                }
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'Continue',
                  child: Container(
                    decoration: BoxDecoration(
                      color: model.themeDark ? grey : primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: model.themeDark ? black : green,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: black,
                        ),
                      ],
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'Delete',
                  child: Container(
                    decoration: BoxDecoration(
                      color: model.themeDark ? grey : primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delete',
                          style:
                              TextStyle(color: model.themeDark ? black : green),
                        ),
                        Icon(
                          Icons.delete,
                          color: black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String formatDate({required date}) {
    return DateFormat('dd-MM-yyyy – hh:mm a')
        .format(DateTime.parse(date))
        .toString();
  }

  String toHijri({required date}) {
    var toHr = HijriCalendar.fromDate(DateTime.parse(date));
    return toHr.toFormat("MMMM dd yyyy");
  }
}
