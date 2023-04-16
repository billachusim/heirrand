import 'package:flutter/material.dart';
import 'package:heirrand/services/helper.dart';

import '../../widgets/bottom_nav.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key, required List transactions});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double _balance = 3200.0;
  List<Transaction> _transactions = [];

  void _showSendDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double _amount = 0.0;

        return AlertDialog(
          title: Text('Send Money'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _amount = double.tryParse(value) ?? 0.0;
            },
            decoration: InputDecoration(
              hintText: 'Amount',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _balance -= _amount;
                  _transactions.add(
                    Transaction(
                      id: UniqueKey().toString(),
                      title: 'Sent Money',
                      date: DateTime.now(),
                      amount: _amount,
                      type: TransactionType.EXPENSE,
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }

  void _showReceiveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double _amount = 0.0;

        return AlertDialog(
          title: Text('Receive Money'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _amount = double.tryParse(value) ?? 0.0;
            },
            decoration: InputDecoration(
              hintText: 'Amount',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _balance += _amount;
                  _transactions.add(
                    Transaction(
                      id: UniqueKey().toString(),
                      title: 'Received Money',
                      date: DateTime.now(),
                      amount: _amount,
                      type: TransactionType.INCOME,
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: Text('Receive'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavBar()),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wallet'),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: getDeviceWidth(context),
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightGreenAccent,
                ),
                child: Column(
                  children: [
                    Text(
                      'Current Balance',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'N$_balance',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transactions',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: _showSendDialog,
                          child: Text('Send'),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: _showReceiveDialog,
                          child: Text('Receive'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    Transaction transaction = _transactions[index];
                    return ListTile(
                      leading: Icon(
                        transaction.type == TransactionType.INCOME
                            ? Icons.arrow_circle_up
                            : Icons.arrow_circle_down,
                        color: transaction.type == TransactionType.INCOME
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(transaction.title,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                      subtitle: Text(
                        '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      trailing: Text(
                        transaction.type == TransactionType.INCOME
                            ? '+${transaction.amount}'
                            : '-${transaction.amount}',
                        style: TextStyle(
                          color: transaction.type == TransactionType.INCOME
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });
}

enum TransactionType {
  INCOME,
  EXPENSE,
}
