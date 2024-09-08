import 'package:flutter/material.dart';
import 'package:medicalapp/providers/medicine_provider.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/widgets/medicine_card.dart';
import 'package:provider/provider.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final medicineProvider = Provider.of<MedicineProvider>(context);
    final medicines = medicineProvider.medicines.where((medicine) {
      return medicine.name!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Medicines',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget searchBar() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        child: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search Medicines...',
            prefixIcon: Icon(Icons.search, color: secondaryTextColor),
            filled: true,
            fillColor: backgroundColor6,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      );
    }

    Widget empty() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.medical_information_outlined,
                  size: 80, color: primaryColor),
              const SizedBox(height: 23),
              Text(
                'Opss no medicine yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Wait for the best medicine',
                style: secondaryTextStyle,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Contact Us',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: medicines.isEmpty
              ? empty()
              : ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: medicines
                      .map((medicine) => MedicineCard(medicine))
                      .toList(),
                ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        searchBar(),
        content(),
      ],
    );
  }
}
