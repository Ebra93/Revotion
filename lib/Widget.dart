import 'package:flutter/material.dart';

import 'package:revotion/constants.dart';

class Erorr extends StatelessWidget {
  final String error;
  const Erorr({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}

class ErrorLog extends StatelessWidget {
  final String error;
  const ErrorLog({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (erorrs.containsKey(error)) {
      return ExpansionTile(
        title: Text('Reason : ' + erorrs[error]!['Reason']!),
        leading: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Code'),
            Text(error)
          ],
        ),
        subtitle: Text('Catagory : ' + erorrs[error]!['Catagory']!),
        trailing: Column(
          children: erorrs[error].toString().length > 30
              ? [
                  Text('Place : ' + erorrs[error]!['wo']!),
                  Text(DateTime.now().toString().split('.')[0].split(' ')[0]),
                  Text(DateTime.now().toString().split('.')[0].split(' ')[1]),
                ]
              : [],
        ),
        children: <Widget>[],
      );
    } else if (error != '') {
      return Text(
        'unkown Error   ' + error,
        style: TextStyle(
          fontFamily: gilroyBold,
          fontSize: 25,
          color: kTextLightColor,
        ),
      );
    } else
      return Text('');
  }
}
