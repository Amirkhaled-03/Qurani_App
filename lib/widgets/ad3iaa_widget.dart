import 'package:flutter/material.dart';
import 'package:qurani/constants.dart';

// ignore: must_be_immutable
class Ad3iaa extends StatelessWidget {
  Ad3iaa({super.key, required this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .9;

    List<String> doaa = [
      " رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي وَاحْلُلْ عُقْدَةً مِّن لِّسَانِي  يَفْقَهُوا قَوْلِي",
      "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
      "رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي ۚرَبَّنَا وَتَقَبَّلْ دُعَاءِ",
      "ربَّنَا اغفِر لي وَلِوالِدَيَّ وَلِلمُؤمِنينَ يَومَ يَقومُ الحِسابُ",
      "اللَّهُمَّ اكفِني بحلالِكَ عَن حرامِك وأغنِني بفضلِك عمَّن سواكَ",
      "اللَّهُمَّ إني أسألك قبل الموت توبة وعند الموت شهادة وبعد الموت جنة ونعيماً يا ذا الجلال والإكرام",
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: kPrimaryColor),
          ),
          Container(
            padding: const EdgeInsets.only(left: 3),
            width: width,
            // height: 80,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                // offset: const Offset(10, 50),
                color: Colors.white.withOpacity(0.3),
              )
            ]),
            child: Card(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                child: Row(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        "Assets/photos/icon.png",
                        color: kPrimaryColor,
                      ),
                      Text((index! + 1).toString()),
                    ]),
                    const Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 260,
                      child: Text(
                        doaa[index!],
                        softWrap: true,
                        style: const TextStyle(
                          overflow: TextOverflow.visible,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Noto Nastaliq Urdu",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
