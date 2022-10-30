import 'package:flutter/material.dart';
import 'package:nubank/objects/cards.dart';
import 'package:nubank/helpful/components.dart';
import 'package:nubank/objects/icones.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _person() {
    return null;
  }

  viewAccount() {
    Navigator.of(context).pushNamed('/account');
  }

  viewPay() {
    Navigator.of(context).pushNamed('/pay');
  }

  List<Cards> listCard = [
    Cards("Celular Seguro. ", "Seu celular protegido, pra você fazer mais.",
        const Color.fromARGB(255, 118, 15, 252), Colors.black),
    Cards("Seguro de Vida a partir de R\$4/mês? ", "Conheça o Nubank Vida",
        Colors.black, const Color.fromARGB(255, 118, 15, 252)),
    Cards("Salve amigos da burocracia. ", "Faça um convite para o Nubank",
        Colors.black, const Color.fromARGB(255, 118, 15, 252)),
  ];

  List<Icones> listIcones = [
    Icones("Área Pix", Icons.fitbit_outlined),
    Icones("Pagar", Icons.store_outlined),
    Icones("Transferir", Icons.eject_outlined),
    Icones("Depositar", Icons.sync_outlined),
    Icones("Pedir empréstimo", Icons.account_balance_outlined),
    Icones("Cartões", Icons.credit_card_outlined),
  ];

  balanceAccount() {
    return InkWell(
      onTap: viewAccount,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Components().createText("Conta", 20),
                  Components().createSizeBox(0, 20),
                  Components().createText("R\$ 0,00", 20),
                  Components().createSizeBox(0, 10),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Components()
                      .createIcon(Icons.keyboard_arrow_right_outlined, 30),
                  Components().createSizeBox(0, 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  createFinishMenu() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            color: const Color.fromARGB(255, 131, 10, 209),
            height: 85,
            child: Components()
                .createText("Olá, Henrique", 20, color: Colors.white),
          ),
        ), // header
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components().createAppBarHome(
          'Olá, Henrique',
          false,
          Icons.person,
          Icons.person,
          Icons.person,
          Icons.person,
          _person,
          context),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            Column(
              children: [
                createFinishMenu(), // terminar layout do menu
                balanceAccount(), // conta
                Container(
                    height: 90,
                    margin: EdgeInsets.only(top: 20),
                    child:
                        Components().scrollIcons(context, listIcones, viewPay)),
                Components().createdCardCredit(), // Cartões
                SizedBox(
                    height: 110,
                    child: Components()
                        .scrollHorizontal(context, listCard)), // cards
                Components().cardCredit(),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ])),
      bottomNavigationBar: Components().bottonNavigator(),
    );
  }
}
