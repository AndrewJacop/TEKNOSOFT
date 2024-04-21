import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'widgets/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Your Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(UtSizes.defaultSpace),

        // Orders
        child: OrderListItems(),
      ),
    );
  }
}
