import 'package:flutter/material.dart';
import 'package:nubank/helpful/components.dart';
import 'package:nubank/objects/icones.dart';
import 'package:nubank/objects/transaction.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Components().createAppBarAccount(
            Icons.arrow_back_ios, Icons.help_outline, action, action, context),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 37, right: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Saldo disponível",
                          style: TextStyle(
                              color: Color.fromARGB(255, 145, 144, 144),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Components().createSizeBox(0, 10),
                      const Text("R\$ 0,00",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 33,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Components().spaceH(),
                  Container(
                    child: Components().createSection(
                        Icons.savings_outlined, text1(), text2(), action),
                  ),
                  Components().spaceH(),
                  Container(
                    child: Components().createSection(
                        Icons.signal_cellular_alt, text3(), text4(), action),
                  ),
                  Components().spaceH(),
                  SizedBox(
                    height: 120,
                    child: scrollIcon(context, listIcones, action),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 221, 223, 228),
                      width: 2,
                      style: BorderStyle.solid),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 37, right: 37),
                child: history(),
              ),
            )
          ],
        ));
  }

  List<Icones> listIcones = [
    Icones("Trazer seu salário", Icons.payments_outlined),
    Icones("Pagar", Icons.vertical_shades_closed),
    Icones("Transferir", Icons.price_change_outlined),
    Icones("Pedir Extrato", Icons.summarize_outlined),
    Icones("Cobrar", Icons.account_balance_outlined),
    Icones("Depositar", Icons.credit_card_outlined),
  ];

  List<Transaction> listTransaction = [
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "Ontem"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "20 OUT"),
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "Ontem"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "20 OUT"),
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "Ontem"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "20 OUT"),
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "Ontem"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "20 OUT"),
  ];

  action() {
    return null;
  }

  text1() {
    return const Text(
      "Dinheiro guardado",
      style: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }

  text2() {
    return const Text(
      "R\$ 0,00",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  text3() {
    return const Text(
      "Rendimento total da conta",
      style: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }

  text4() {
    return RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: "+R\$ 0,00",
            style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: " este mês",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ]),
    );
  }

  history() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Histórico",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 235, 240),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          child: Row(
            children: [
              IconButton(
                  onPressed: action,
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 145, 144, 144),
                  )),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Buscar",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 145, 144, 144)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 270,
          width: double.infinity,
          child: transactionView(),
        )
      ],
    );
  }

  transactionView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listTransaction.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 100,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(96, 165, 165, 165),
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 233, 235, 240),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(60.0))),
                                child: Components().createIcon(
                                    listTransaction[index].icon, 30)),
                          ),
                          Expanded(
                            flex: 75,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listTransaction[index].title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Components().createText(
                                      listTransaction[index].from,
                                      16,
                                      Colors.grey),
                                  Components().createText(
                                      listTransaction[index].value,
                                      16,
                                      Colors.grey),
                                  Components().createText(
                                      listTransaction[index].method,
                                      14,
                                      Colors.grey),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: Components().createText(
                                listTransaction[index].date, 16, Colors.grey),
                          ),
                        ],
                      ));
                },
              )),
        ),
      ],
    );
  }

  scrollIcon(context, List<Icones> listIcon, _action) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listIcon.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: 83,
                      margin: const EdgeInsets.only(right: 18),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 233, 235, 240),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60.0))),
                            child: IconButton(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 24, 24),
                                icon: Components()
                                    .createIcon(listIcon[index].icon, 30),
                                onPressed: _action),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                listIcon[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ));
                },
              )),
        ),
      ],
    );
  }
}
