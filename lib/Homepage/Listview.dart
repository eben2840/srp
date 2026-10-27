import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomListTile(
          title: 'Reset Password',
          subtitle: 'Reset Student Gmail',
          leadingText: 'O',
          color: Color.fromARGB(255, 229, 91, 91),
          icon: Icons.arrow_forward_ios_sharp,
        ),
        CustomListTile(
          title: 'Update ID Number',
          subtitle: 'Update Index Number',
          leadingText: 'V',
          color: Color.fromARGB(255, 229, 91, 91),
          icon:  Icons.arrow_forward_ios_sharp,
        ),
        CustomListTile(
          title: 'Create New E-mail',
          subtitle: 'Create New Student Email?',
          leadingText: 'E',
          color: Color.fromARGB(255, 229, 91, 91),
          icon:  Icons.arrow_forward_ios_sharp,
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingText;
  final Color color;
  final IconData icon;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingText,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          leadingText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(icon),
    );
  }
}
