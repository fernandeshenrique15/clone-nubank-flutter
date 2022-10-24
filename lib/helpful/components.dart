import 'package:flutter/material.dart';
import 'package:nubank/objects/cards.dart';
import 'package:nubank/objects/icones.dart';

class Components {
  createText(text, size, [color]) {
    color = color == null ? Colors.black : color;
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }

  createImage(src, file, extension) {
    return Image(
      image: AssetImage("$src$file.$extension"),
    );
  }

  createInputText(
      typeKeyboard, String text, TextAlign align, controller, String msgError) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: typeKeyboard,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
          textAlign: align,
          style: const TextStyle(fontSize: 30),
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return msgError;
            }
          },
        ));
  }

  createButton(controllerForm, action, String title) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  if (controllerForm.currentState!.validate()) {
                    action();
                  }
                },
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  createIcon(icon, double size, [color]) {
    color = color == null ? Colors.black : color;
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }

  createSizeBox([width, height]) {
    return SizedBox(width: width, height: height);
  }

  createAppBarAccount(icon1, icon2, action1, action2, context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.white,
      shadowColor: Color.fromARGB(0, 255, 193, 7),
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: action1,
          icon: IconButton(
              onPressed: action1, icon: createIcon(icon1, 30, Colors.grey)),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 5),
          child: IconButton(
              onPressed: action2, icon: createIcon(icon2, 30, Colors.grey)),
        )
      ],
    );
  }

  createSection(icon, text1, text2, action) {
    return Row(
      children: [
        createIcon(icon, 10),
        Column(children: [Text(text1), Text(text2)]),
        createIcon(Icons.arrow_forward_ios, 10)
      ],
    );
  }

  createAppBarHome(title, center, icon1, icon2, icon3, icon4, action, context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 131, 10, 209),
      toolbarHeight: 50,
      leading: Container(
        margin: const EdgeInsets.only(left: 20, top: 15),
        child: createIcon(icon2, 30, Colors.white),
        decoration: const BoxDecoration(
          color: Color.fromARGB(40, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      centerTitle: true,
      shadowColor: const Color.fromARGB(0, 255, 193, 7),
      actions: [
        Column(
          children: [
            createSizeBox(0, 15),
            Row(
              children: [
                createIcon(Icons.visibility, 30, Colors.white),
                createSizeBox(30, 0),
                createIcon(Icons.help, 30, Colors.white),
                createSizeBox(30, 0),
                createIcon(Icons.person_add, 30, Colors.white),
                createSizeBox(30, 0),
              ],
            ),
          ],
        ),
      ],
    );
  }

  createdCardCredit() {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 40),
        padding: const EdgeInsets.fromLTRB(9, 13, 9, 13),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 221, 223, 228),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          children: const [
            Icon(Icons.card_travel),
            SizedBox(
              width: 10,
            ),
            Text(
              'Meus cartões',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  bottonNavigator() {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Color.fromARGB(96, 165, 165, 165),
              width: 2,
              style: BorderStyle.solid),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 33,
            child: Components().createIcon(Icons.swap_vert, 35, Colors.grey),
          ),
          Expanded(
            flex: 33,
            child: Components()
                .createIcon(Icons.attach_money_outlined, 35, Colors.grey),
          ),
          Expanded(
            flex: 33,
            child: Components()
                .createIcon(Icons.shopping_bag_outlined, 35, Colors.grey),
          )
        ],
      ),
    );
  }

  scrollIcons(context, List<Icones> listIcon, _action) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
              height: 90.0,
              margin: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listIcon.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 221, 223, 228),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60.0))),
                            child: IconButton(
                              padding: const EdgeInsets.all(15),
                              icon: createIcon(listIcon[index].icon, 25),
                              onPressed: _action,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                listIcon[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ))
                        ],
                      ));
                },
              )),
        ),
      ],
    );
  }

  balanceAccount() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 25, 0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Components().createText("Conta", 20),
                createSizeBox(0, 20),
                Components().createText("R\$ 0,00", 20),
                createSizeBox(0, 10),
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
                createIcon(Icons.keyboard_arrow_right_outlined, 30),
                createSizeBox(0, 30),
              ],
            ),
          ),
        ),
      ],
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
            child: Components().createText("Olá, Henrique", 20, Colors.white),
          ),
        ), // header
      ],
    );
  }

  scrollHorizontal(context, List<Cards> listCard) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
              height: 90.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCard.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 0),
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 221, 223, 228),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Wrap(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: listCard[index].text1,
                                      style: TextStyle(
                                          color: listCard[index].color1)),
                                  TextSpan(
                                      text: listCard[index].text2,
                                      style: TextStyle(
                                          color: listCard[index].color2)),
                                ]),
                              )),
                        ],
                      ));
                },
              )),
        ),
      ],
    );
  }

  cardCredit() {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 20),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Color.fromARGB(96, 165, 165, 165),
                  width: 2,
                  style: BorderStyle.solid))),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Cartão de crédito",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Components().createSizeBox(0, 10),
              const Text("Fatura atual",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 138, 138, 138))),
              Components().createSizeBox(0, 10),
              const Text("R\$ 00,00",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
              Components().createSizeBox(0, 10),
              const Text("Limite disponível de R\$ 1.000,00",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 138, 138, 138))),
            ],
          )
        ],
      ),
    );
  }
}
