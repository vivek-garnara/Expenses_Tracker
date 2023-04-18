import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deletetx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deletetx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  // late Color _bgColor;

  // void initState() {
  //   const availableColors = [
  //     Colors.purple,
  //     Colors.blue,
  //     Colors.amber,
  //     Colors.greenAccent
  //   ];

  //   _bgColor = availableColors[Random().nextInt(4)];
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}',
                    style: TextStyle(color: Colors.black))),
          ),
        ),
        title: Text(
          '${widget.transaction.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => widget.deletetx(widget.transaction.id),
                icon: Icon(Icons.delete_rounded),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: () => widget.deletetx(widget.transaction.id),
                icon: Icon(Icons.delete_rounded),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
