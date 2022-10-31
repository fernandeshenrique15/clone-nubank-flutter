import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nubank/helpful/components.dart';
import 'package:nubank/objects/icones.dart';
import 'package:nubank/objects/transaction.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Color colorTransparent = const Color.fromARGB(0, 244, 67, 54);

  ScrollController _pageScroll = ScrollController();
  TextEditingController searchControl = TextEditingController();
  GlobalKey<FormState> formControl = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: createAppBarAccount(Icons.arrow_back_ios, Icons.help_outline,
            returnPage, action, context),
        body: SingleChildScrollView(
            controller: _pageScroll,
            scrollDirection: Axis.vertical,
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        balanceAvaiable(),
                        Components().spaceH(),
                        Container(
                          child: Components().createSection(
                              Icons.savings_outlined, text1(), text2(), action),
                        ),
                        Components().spaceH(),
                        Container(
                          child: Components().createSection(
                              Icons.signal_cellular_alt,
                              text3(),
                              text4(),
                              action),
                        ),
                        Components().spaceH(),
                        SizedBox(
                          height: 120,
                          child: scrollIcon(context, listIcones),
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
                      margin:
                          const EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: history(),
                    ),
                  )
                ],
              )
            ])));
  }

  List<Icones> listIcones = [
    Icones("Trazer seu salário", Icons.payments_outlined, "/criar"),
    Icones("Pagar", Icons.vertical_shades_closed, "/pay"),
    Icones("Transferir", Icons.price_change_outlined, "/criar"),
    Icones("Pedir Extrato", Icons.summarize_outlined, "/criar"),
    Icones("Cobrar", Icons.account_balance_outlined, "/criar"),
    Icones("Depositar", Icons.credit_card_outlined, "/criar"),
  ];

  List<Transaction> listTransaction = [
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "Ontem"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "31 OUT"),
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "30 OUT"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "29 OUT"),
    Transaction(Icons.arrow_circle_up, "Transferência enviada",
        "Henrique Fernandes Neto", "R\$ 100,00", "Pix", "28 OUT"),
    Transaction(Icons.arrow_circle_down, "Transferência recebida", "João Paulo",
        "R\$ 100,00", "Pix", "27 OUT"),
  ];

  createAppBarAccount(icon1, icon2, action1, action2, context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.white,
      shadowColor: colorTransparent,
      leading: Container(
        margin: const EdgeInsets.only(left: 15),
        child: IconButton(
            onPressed: action1,
            hoverColor: colorTransparent,
            highlightColor: colorTransparent,
            icon: Components().createIcon(icon1, 25, Colors.grey)),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 30, top: 5),
          child: IconButton(
              hoverColor: colorTransparent,
              highlightColor: colorTransparent,
              onPressed: action2,
              icon: Components().createIcon(icon2, 25, Colors.grey)),
        )
      ],
    );
  }

  action() {
    return null;
  }

  returnPage() {
    Navigator.pop(context);
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
                  hoverColor: colorTransparent,
                  highlightColor: colorTransparent,
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 145, 144, 144),
                  )),
              const SizedBox(
                width: 7,
              ),
              Form(
                  key: formControl,
                  child: SizedBox(
                      width: 200,
                      height: 35,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: "Buscar",
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        textAlign: TextAlign.start,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                        controller: searchControl,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite a pesquisa";
                          }
                        },
                      ))),
            ],
          ),
        ),
        SizedBox(
          height: listTransaction.length * 140,
          width: double.infinity,
          child: transactionView(),
        )
      ],
    );
  }

  transactionView() {
    return ListView.builder(
      itemCount: listTransaction.length,
      itemBuilder: (context, index) {
        return Container(
            height: 110,
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(bottom: 7),
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
                      padding: const EdgeInsets.fromLTRB(3, 4, 3, 4),
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(60.0))),
                      child: Components()
                          .createIcon(listTransaction[index].icon, 30)),
                ),
                Expanded(
                  flex: 55,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listTransaction[index].title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Components().createText(listTransaction[index].from, 16,
                            color: Colors.grey),
                        Components().createText(
                            listTransaction[index].value, 16,
                            color: Colors.grey),
                        Components().createText(
                            listTransaction[index].method, 14,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Components().createText(
                      listTransaction[index].date, 16,
                      color: Colors.grey),
                ),
              ],
            ));
      },
    );
  }

  balanceAvaiable() {
    return Column(
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
                color: Colors.black, fontSize: 33, fontWeight: FontWeight.bold))
      ],
    );
  }

  scrollIcon(context, List<Icones> listIcon) {
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
                                hoverColor: colorTransparent,
                                highlightColor: colorTransparent,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                icon: Components()
                                    .createIcon(listIcon[index].icon, 24),
                                onPressed: action),
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
