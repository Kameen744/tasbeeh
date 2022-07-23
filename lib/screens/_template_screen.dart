import 'package:flutter/material.dart';
import 'package:tasbeeh/scoped_models/counter_model.dart';
import 'package:tasbeeh/screens/base_screen.dart';

class TemplateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<CounterModel>(
        builder: (context, child, model) => Scaffold());
  }
}
