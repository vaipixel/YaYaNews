import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  @mustCallSuper
  void init(BuildContext context) {
    doInit(context);
  }

  @protected
  void doInit(BuildContext context);

  void dispose();
}