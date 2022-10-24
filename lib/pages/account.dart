import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nubank/helpful/components.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  action() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components().createAppBarAccount(
          Icons.arrow_back_ios, Icons.help_outline, action, action, context),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saldo disponível",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Components().createSizeBox(0, 10),
                Text(
                  "R\$ 0,00",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 31,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Components().createSection(
                Icons.piano, "Dinheiro guardado", "R\$ 0,00", action),
          ],
        ),
      ),
    );
  }
}
