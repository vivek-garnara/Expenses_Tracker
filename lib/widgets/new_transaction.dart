import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();
  DateTime? _selectedDate = null;

  void _submitData() {
    final enteredTitle = _titleInput.text;
    final enteredAmount = double.parse(_amountInput.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30),
          // margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                controller: _titleInput,
                //onSubmitted: (_) => submitData(),

                // onChanged: (value) => titleInput = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                keyboardType: TextInputType.number,
                controller: _amountInput,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) => amountInput = value,
              ),
              Container(
                height: 70,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedDate == null
                          ? 'no date Chosen !'
                          : DateFormat.yMMMd().format(_selectedDate!)),
                      FlatButton(
                        onPressed: _presentDatePicker,
                        child: Text('Choose the Date'),
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ]),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text('Add Transaction'),
                textColor: Theme.of(context).textTheme.button?.color,
                color: Theme.of(context).primaryColor,
                focusColor: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
