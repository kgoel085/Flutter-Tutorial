import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/widgets/chart/widget.dart';
import './widgets/transactions/list.dart';
import './widgets/transactions/text_fields.dart';
import './widgets/transactions/model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.portraitUp,
  //   ],
  // );
  runApp(MyApp());
}

const Map<String, String> appSettings = {'appName': 'Personal Expenses'};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appSettings['appName'],
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amberAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
          (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))),
        )
        .toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime dateTime) {
    final tx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: dateTime,
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  void _startAddNewTraction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: TransactionTextFields(submitHandler: _addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    if (id.isEmpty) return;

    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQry = MediaQuery.of(context);
    final bool isLandscape = mediaQry.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(appSettings['appName']),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTraction(context),
          icon: Icon(Icons.add),
        ),
      ],
    );

    double actualHeight(double height) {
      return (mediaQry.size.height -
              appBar.preferredSize.height -
              mediaQry.padding.top) *
          height;
    }

    final TransactionListWIdget = Container(
      height: actualHeight(0.7),
      child: TransactionList(
        userTransactions: _userTransactions,
        deleteTransaction: _deleteTransaction,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show chart'),
                  Switch(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: actualHeight((isLandscape) ? 0.7 : 0.3),
                child: ChartWidget(recentTransactions: _recentTransactions),
              ),
            if (!isLandscape) TransactionListWIdget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: actualHeight(0.7),
                      child:
                          ChartWidget(recentTransactions: _recentTransactions),
                    )
                  : TransactionListWIdget,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTraction(context),
      ),
    );
  }
}
