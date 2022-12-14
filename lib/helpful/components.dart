import 'package:flutter/material.dart';
import 'package:nubank/objects/cards.dart';
import 'package:nubank/objects/icones.dart';

class Components {
  final Color colorTransparent = Color.fromARGB(0, 244, 67, 54);

  createText(String text, double size, {Color color = Colors.black}) {
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

  createSection(icon, text1, text2, action) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: createIcon(icon, 30)),
        Expanded(
          flex: 80,
          child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [text1, createSizeBox(0, 5), text2])),
        ),
        Expanded(
            flex: 15,
            child: Container(
                margin: const EdgeInsets.only(right: 15),
                child: createIcon(Icons.arrow_forward_ios, 15,
                    Color.fromARGB(255, 122, 122, 122))))
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
      shadowColor: colorTransparent,
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
            color: Color.fromARGB(255, 233, 235, 240),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          children: const [
            Icon(Icons.card_travel),
            SizedBox(
              width: 10,
            ),
            Text(
              'Meus cart??es',
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

  scrollIcons(context, List<Icones> listIcon) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
              height: 92.0,
              margin: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listIcon.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 92,
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
                              padding: const EdgeInsets.all(15),
                              icon: createIcon(listIcon[index].icon, 24),
                              onPressed: () => {
                                Navigator.of(context)
                                    .pushNamed(listIcon[index].page)
                              },
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

  spaceH() {
    return const SizedBox(
      height: 40,
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
                          color: Color.fromARGB(255, 233, 235, 240),
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
              const Text("Cart??o de cr??dito",
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
              const Text("Limite dispon??vel de R\$ 1.000,00",
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
