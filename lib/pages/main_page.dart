import 'package:flutter/material.dart';
import 'package:medicalapp/pages/home/chat_page.dart';
import 'package:medicalapp/pages/home/medicine_page.dart';
import 'package:medicalapp/pages/home/profile_page.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({this.initialIndex = 0, super.key});

  final int initialIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const ChatPage(),
    const MedicinePage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex; // Set initialIndex dari argumen
  }

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        backgroundColor: primaryColor,
        child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: Container(
            color: Colors.transparent,
            height: kBottomNavigationBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(
                          Icons.home,
                          size: 24,
                          color: currentIndex == 0
                              ? primaryColor
                              : const Color(0xff808191),
                        ),
                        onPressed: () => setState(() => currentIndex = 0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(
                          Icons.chat,
                          size: 24,
                          color: currentIndex == 1
                              ? primaryColor
                              : const Color(0xff808191),
                        ),
                        onPressed: () => setState(() => currentIndex = 1),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(
                          Icons.medical_services,
                          size: 24,
                          color: currentIndex == 2
                              ? primaryColor
                              : const Color(0xff808191),
                        ),
                        onPressed: () => setState(() => currentIndex = 2),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 24,
                          color: currentIndex == 3
                              ? primaryColor
                              : const Color(0xff808191),
                        ),
                        onPressed: () => setState(() => currentIndex = 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
