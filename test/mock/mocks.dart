import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/http/webclients/transaction_webclient.dart';
import 'package:mockito/mockito.dart';

class MockContactDao extends Mock implements ContactDao {}

class MockTransactionWebClient extends Mock implements TransactionWebClient {}
