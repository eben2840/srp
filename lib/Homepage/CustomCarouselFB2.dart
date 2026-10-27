import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      "https://webcms.central.edu.gh/wp-content/uploads/2023/08/CU-GRADUATION-22-OFFICIAL-PHOTOGRAPHS-7.jpg",
      "https://webcms.central.edu.gh/wp-content/uploads/2023/08/IMG_0217_Career-and-Counselling.jpg", 
      "https://webcms.central.edu.gh/wp-content/uploads/2023/08/IMG_9840-132.jpg",
      "https://webcms.central.edu.gh/wp-content/uploads/2023/08/LAW-AND-COMMUNITY-GStar-Multimedia-36.jpg",
      "https://webcms.central.edu.gh/wp-content/uploads/2023/08/CU-GRADUATION-22-OFFICIAL-PHOTOGRAPHS-56.jpg",
      "https://webcms.central.edu.gh/wp-content/uploads/2023/08/ATLETICS-CU-SRC-MTN-22-53.jpg",
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.9,
          ),
          items: imageUrls.map((imageUrl) {
            return Container(
               decoration: BoxDecoration(
        color: const Color.fromARGB(255, 164, 164, 164),
        borderRadius: BorderRadius.circular(15),
      ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
