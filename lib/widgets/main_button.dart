import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/scoped_models/home_model.dart';

import 'colors.dart';

class MainButton extends StatelessWidget {
  final title;
  final String bg;
  final onClick;
  HomeModel model;

  MainButton({
    this.title,
    required this.bg,
    required this.onClick,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(bg),
            fit: BoxFit.cover,
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onClick,
          child: title == 'After Salah'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: primary,
                                fontSize: model.width(context) * 0.06,
                                fontFamily: 'GentiumBookBasic-Regular',
                              ),
                            ),
                            Text(
                              'Counter',
                              style: TextStyle(
                                  color: primary,
                                  fontSize: model.width(context) * 0.04),
                            ),
                            SizedBox(
                              height: model.height(context) * 0.04,
                            ),
                            Text(
                              'Goto >',
                              style: TextStyle(
                                  color: primary,
                                  fontSize: model.width(context) * 0.03),
                            ),
                          ],
                        )),
                    getImage(title, model, context),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: getImage(title, model, context),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: primary,
                            fontSize: model.width(context) * 0.06,
                            fontFamily: 'GentiumBookBasic-Regular',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget getImage(type, HomeModel model, BuildContext context) {
    String dark = model.themeDark ? 'Dark' : '';
    String img = 'assets/images/tasbeehIcon$dark.png';
    double h = model.height(context) * 0.14;
    switch (type) {
      case 'Dhikr':
        img = 'assets/images/dhikrIcon$dark.png';
        h = model.height(context) * 0.11;
        break;
      case 'Records':
        img = 'assets/images/recordIcon$dark.png';
        h = model.height(context) * 0.11;
        break;
    }
    return Image(
      image: AssetImage(img),
      height: h,
    );
  }
}
