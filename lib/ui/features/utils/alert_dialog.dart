import 'package:flutter/material.dart';

Future<bool> showMyDialog(BuildContext context) async {
  var delete = false;


  await showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Deseja realmente excluir esse item?'),
              Text('Essa ação não poderá ser desfeita.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Sim'),
            onPressed: () {
              delete = true;
              Navigator.of(context).pop();
            },
          ),
           TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  return delete;
}