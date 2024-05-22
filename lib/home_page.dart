import 'package:car_shop/widgets/galeriya.dart';
import 'package:car_shop/widgets/plitka.dart';
import 'package:car_shop/widgets/spisok.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTrue1 = true;
  bool isTrue2 = false;
  bool isTrue3 = false;
  String searchText = "";
  final controller = TextEditingController();

  void updateView(String value) {
    setState(() {
      searchText = value.toLowerCase();
      if (searchText == "plitka") {
        isTrue1 = false;
        isTrue2 = false;
        isTrue3 = true;
      } else if (searchText == "galeriya") {
        isTrue1 = true;
        isTrue2 = false;
        isTrue3 = false;
      } else if (searchText == "spisok") {
        isTrue1 = false;
        isTrue2 = true;
        isTrue3 = false;
      } else {
        isTrue1 = true;
        isTrue2 = false;
        isTrue3 = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text("Car Company"),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/images/swap.png",
              width: 23,
            ),
          ),
          const Gap(15),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      isTrue1 = true;
                      isTrue2 = false;
                      isTrue3 = false;
                    });
                  },
                  child: const Text("Галерия"),
                ),
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      isTrue1 = false;
                      isTrue2 = true;
                      isTrue3 = false;
                    });
                  },
                  child: const Text("Список"),
                ),
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      isTrue1 = false;
                      isTrue2 = false;
                      isTrue3 = true;
                    });
                  },
                  child: const Text("Плитка"),
                ),
              ];
            },
            child: Image.asset(
              "assets/images/menu.png",
              width: 23,
            ),
          ),
          const Gap(10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: controller,
              onChanged: updateView,
              decoration: InputDecoration(
                hintText: "  Search...",
                contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: isTrue1
                ? const Galeriya()
                : (isTrue2
                    ? const Spisok()
                    : (isTrue3 ? const Plitka() : const Galeriya())),
          ),
        ],
      ),
    );
  }
}
