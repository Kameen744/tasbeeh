import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tasbeeh/services/service_locator.dart';

class BaseScreen<T extends Model> extends StatelessWidget {
  final ScopedModelDescendantBuilder<T> _builder;
  BaseScreen({required ScopedModelDescendantBuilder<T> builder})
      : _builder = builder;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: locator<T>(),
        child: ScopedModelDescendant<T>(
          builder: _builder,
        ));
  }
}
