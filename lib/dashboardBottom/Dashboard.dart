import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srp/Homepage/HomepageScreen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int indexMenu = 0;
  final menu = [
    {
      'icon': 'assets/images/home-agreement.png',
      'icon_active': 'assets/images/home-agreement.png',
      'label': 'Home',  // Ensure the label key is correctly used here
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/images/clipboard copy.png',
      'icon_active': 'assets/images/clipboard copy.png',
      'label': 'My Portals',  // Label is correctly specified
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/images/user copy.png',
      'icon_active': 'assets/images/user copy.png',
      'label': 'Profile',  // Correct label
      'fragment': const HomeFragment(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: menu[indexMenu]['fragment'] as Widget,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: List.generate(menu.length, (index) {
            Map item = menu[index];
            bool isActive = indexMenu == index;
            
            String icon = item['icon'] ?? ''; // Default to an empty string if null
            String iconActive = item['icon_active'] ?? '';
            String label = item['label'] ?? 'Unknown'; // Default to 'Unknown' if null

            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    indexMenu = index;
                  });
                },
                child: SizedBox(
                  height: 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(20),
                      ImageIcon(
                        AssetImage(
                          isActive ? iconActive : icon,
                        ),
                        size: 24,
                        color: isActive
                            ? const Color.fromARGB(255, 123, 18, 11)
                            : Colors.grey,
                      ),
                      // if (isActive) const Gap(6),
                      // if (isActive)
                      //   Container(
                      //     height: 5,
                      //     width: 10,
                      //     decoration: BoxDecoration(
                      //       color: const Color.fromARGB(255, 86, 17, 12),
                      //       borderRadius: BorderRadius.circular(18),
                      //     ),
                      //   ),
                      // Label under icon
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          color: isActive
                              ? const Color.fromARGB(255, 123, 18, 11)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
