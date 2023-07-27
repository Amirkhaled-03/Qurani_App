import 'package:flutter/material.dart';
import 'package:qurani/widgets/ad3iaa_widget.dart';
import 'package:qurani/widgets/header_widget.dart';

class Ad3iaScreen extends StatelessWidget {
  const Ad3iaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.9;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 16,
          right: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: "Baca Doa-Doa",
            ),
            Container(
              clipBehavior: Clip.none,
              height: height,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Ad3iaa(
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
