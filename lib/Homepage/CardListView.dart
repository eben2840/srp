import 'package:flutter/material.dart';



class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
               Card(
                "SIP OSIS",
                "S",
                // "assets/images/study-time.png",
                "My Osis Platform"),
                   Card(
                "VCampus",
                "V",
                // "assets/images/study-time.png",
                "My VCampus"),
                   Card(
                " My Gmail",
                "S",
                // "assets/images/study-time.png",
                "Student Gmail"),
            Card(
                "Timetable",
                "T",
                // "assets/images/study-time.png",
                "My Amanda"),
            Card(
                "Pasco Portal ",
                "P",
                // "assets/images/studying.png",
                "Past Question"),
            Card(
                "Booking",
                 "B",
                // "assets/images/study-time.png",
                "Book Faciliities"),
          ],
        ),
      ),
    );
  }
}




class Card extends StatelessWidget {
  final String text;
  // final String imageUrl;
  final String subtitle;
  final String title;

  const Card(this.text, this.title, this.subtitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15,right: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12.5),
          // box shadow
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 9,
              offset: const Offset(0,2),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 91, 91),
                borderRadius: BorderRadius.circular(12.5),
                // box shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 9,
                    offset: const Offset(0,2),
                  ),
                ],
              ),
              child: Text(title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  ),
                  
            ),
            // Image.asset(imageUrl, height:40, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 2,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}