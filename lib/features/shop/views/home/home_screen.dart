import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_appbar.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                child: Column(
              children: [
                HomeAppBar(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
