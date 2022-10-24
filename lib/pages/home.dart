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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components().createAppBar('Olá, Henrique', false, Icons.person,
          Icons.person, Icons.person, Icons.person, _person, context),
      body: Column(
        children: [
          Components().createFinishMenu(), // terminar layout do menu
          Components().balanceAccount(), // conta
          SizedBox(
              height: 90,
              child: Components().scrollIcons(context, listIcones, _person)),
          Components().createdCardCredit(), // Cartões
          SizedBox(
              height: 110,
              child: Components().scrollHorizontal(context, listCard)), // cards
          Components().cardCredit(),
        ],
      ),
      bottomNavigationBar: Components().bottonNavigator(),
    );
  }
}
