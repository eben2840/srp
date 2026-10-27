import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srp/Homepage/CardListView.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String categorySelected = 'All Coffee';
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
       
          },
        ),
        title: const Text('Student Resource Portal'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),  // You can adjust the color as per your design
        elevation: 0,  // Optional: If you want no shadow
        centerTitle: true, // Optional: Centers the title in the AppBar
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Stack(
              children: [  
                buildBackground(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const Gap(208),
                      
                       const Gap(50),
                      //  Headlin e(),
                      Row(
                        children: [
                          const Text(
                            'Recommended',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          // Spacer(),
                          // Icon(Icons.arrow_forward_ios_rounded
                          // ,
                          // color: Colors.black,
                          // size: 16
                          // )
                        ],
                      ),
                     
                      CardListView(),
                      //  const Gap(10),
                        //  PromoCard(),
                      //  const Gap(10),
                      // Headline(),
                     ® // const Gap(10),
                      // Listview(),
                    
                       
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackground() {
    return Container(
      height: 230,
      child: Stack(
        children: [
          // Image background
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(
                  'https://webcms.central.edu.gh/wp-content/uploads/2024/09/Admission-24-web-2-copy.png', // Replace with your image URL
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black54, // Semi-transparent black
                  Colors.transparent, // Fully transparent
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello Ohene,',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        Row(
          children: [
            const Text(
              'Good Morning👋🏽',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const Gap(4),
          ],
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/ic_search.png'),
                  color: Colors.black,
                ),
                const Gap(8),
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0),
                      overlayColor: MaterialStatePropertyAll(Colors.grey), // Adds tap effect
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context, '/search'
                      );
                    },
                    child: const Text("Search for questions"),
                  )
                ),
              ],
            ),
          ),
        ),
        const Gap(16),
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage('assets/ic_filter.png'),
            size: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildBannerPromo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/Pink Modern Cosmetics Store Sale Promotion Facebook Ad (1).png',
        width: double.infinity,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}
