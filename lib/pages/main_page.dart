import 'package:flutter/material.dart';
import 'package:medicalapp/pages/home/chat_page.dart';
import 'package:medicalapp/pages/home/medicine_page.dart';
import 'package:medicalapp/pages/home/profile_page.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
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
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: currentIndex,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (value) => setState(() => currentIndex = value),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Icon(Icons.home,
                        size: 24,
                        color: currentIndex == 0
                            ? primaryColor
                            : const Color(0xff808191)),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 40,
                    ),
                    child: Icon(Icons.chat,
                        size: 24,
                        color: currentIndex == 1
                            ? primaryColor
                            : const Color(0xff808191)),
                  ),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 40,
                    ),
                    child: Icon(Icons.medical_services,
                        size: 24,
                        color: currentIndex == 2
                            ? primaryColor
                            : const Color(0xff808191)),
                  ),
                  label: 'Medicine',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Icon(Icons.person,
                        size: 24,
                        color: currentIndex == 3
                            ? primaryColor
                            : const Color(0xff808191)),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const MedicinePage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
