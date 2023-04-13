import 'package:baltini_kent/components/widget/global_widget/info_widget.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('My Account', style: Theme.of(context).textTheme.titleLarge),
            ),
            const InfoWidget(text: 'About Baltini', top: 8, bottom: 8),
            const InfoWidget(text: 'Terms and Conditions', top: 8, bottom: 8),
            const InfoWidget(text: 'Partnership', top: 8, bottom: 8),
            const InfoWidget(text: 'Helps', top: 8, bottom: 8),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('LOGIN TO BALTINI')),
            ),
          ],
        ),
      ),
    );
  }
}
