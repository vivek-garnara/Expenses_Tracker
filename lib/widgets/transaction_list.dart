import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletetx;
  TransactionList(this.transaction, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: [
              Text(
                'No transaction added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        : ListView(
            children: transaction
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transaction: tx, deletetx: deletetx))
                .toList()
            // return Card(
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(8),
            //         margin: EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //                 width: 2, color: Colors.amberAccent)),
            //         child: Text(
            //           '\$ ${transaction[index].amount.toStringAsFixed(2)}',
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 16,
            //               color: Colors.amber),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             transaction[index].title,
            //             //style: Theme.of(context).textTheme.headline6,
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 16),
            //           ),
            //           Text(
            //             DateFormat.yMMMd()
            //                 .format(transaction[index].date),
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.grey),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // )

            );
  }
}
