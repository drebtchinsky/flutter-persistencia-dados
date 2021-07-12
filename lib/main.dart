import 'dart:async';

import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/http/webclients/transaction_webclient.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:bytebank2/widgets/app_dependences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseCrashlytics.instance.setUserIdentifier('alura123');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  runZonedGuarded<Future<void>>(() async {
    runApp(Bytebank2App(
      contactDao: ContactDao(),
    ));
  }, FirebaseCrashlytics.instance.recordError);
}

class Bytebank2App extends StatelessWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  const Bytebank2App(
      {Key key, @required this.contactDao, @required this.transactionWebClient})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return AppDependences(
      contactDao: contactDao,
      transactionWebClient: transactionWebClient,
      child: MaterialApp(
        theme: theme.copyWith(
          primaryColor: Colors.green[900],
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard(),
      ),
    );
  }
}
