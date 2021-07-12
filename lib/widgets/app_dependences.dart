import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/http/webclients/transaction_webclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/app.dart';

class AppDependences extends InheritedWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  AppDependences(
      {@required this.contactDao,
      @required this.transactionWebClient,
      @required Widget child})
      : super(child: child);

  static AppDependences of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependences>();

  @override
  bool updateShouldNotify(AppDependences oldWidget) {
    return contactDao != oldWidget.contactDao ||
        transactionWebClient != oldWidget.transactionWebClient;
  }
}
