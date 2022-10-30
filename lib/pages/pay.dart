import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nubank/helpful/components.dart';
import 'package:nubank/objects/payMethod.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  final Color colorTransparent = Color.fromARGB(0, 244, 67, 54);

  _back() {
    Navigator.pop(context);
  }

  _appBarPay() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: colorTransparent,
      leading: IconButton(
        color: Colors.grey,
        onPressed: _back,
        icon: Icon(Icons.close),
      ),
    );
  }

  List<PayMethod> listMethods = [
    PayMethod(
        const Text(
          "Pagar Pix com QR Code",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        RichText(
          text: const TextSpan(children: [
            TextSpan(
                text:
                    "Leia o QR Code ou copie e cole o código e page com saldo da conta ou ",
                style:
                    TextStyle(color: Colors.grey, fontSize: 14, height: 1.5)),
            TextSpan(
                text: "cartão de crédito.",
                style: TextStyle(
                    color: Color.fromARGB(255, 131, 10, 209), fontSize: 14)),
          ]),
        ),
        Icons.fitbit,
        1),
    PayMethod(
        const Text(
          "Pagar fatura do cartão",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const Text(
          "Gere um boleto ou pague com seu saldo",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Icons.credit_card,
        0),
    PayMethod(
        const Text(
          "Pagar boleto",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const Text(
          "Use o saldo da conta ou cartão de crédito",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Icons.vertical_shades_closed,
        0),
    PayMethod(
        const Text(
          "Buscador de boletos",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const Text(
          "A gente traz seus boletos bancários já digitalizados para você.",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Icons.sync,
        0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBarPay(),
        body: Container(
          margin: EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            children: [
              Text(
                "Estas são suas opções de pagamento",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: listMethods.length * 100,
                child: ListView.builder(
                    itemCount: listMethods.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Components()
                                      .createIcon(listMethods[index].icon, 30)),
                              Expanded(
                                flex: 70,
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 25, right: 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          listMethods[index].title,
                                          Components().createSizeBox(0, 5),
                                          listMethods[index].description
                                        ])),
                              ),
                              Visibility(
                                  visible: listMethods[index].recent == 1,
                                  child: Expanded(
                                      flex: 12,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 131, 10, 209),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                        padding: EdgeInsets.all(3),
                                        child: const Text(
                                          "Novo",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ))),
                              Expanded(
                                flex: 5,
                                child: Container(
                                    margin: const EdgeInsets.only(left: 7),
                                    child: Components().createIcon(
                                        Icons.arrow_forward_ios,
                                        15,
                                        Color.fromARGB(255, 122, 122, 122))),
                              ),
                            ],
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}
