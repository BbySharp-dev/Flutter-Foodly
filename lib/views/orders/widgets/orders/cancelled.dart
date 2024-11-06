import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_orders.dart';
import 'package:foodly/models/client_orders.dart';
import 'package:foodly/views/orders/widgets/client_order_tile.dart';

class Cancelled extends HookWidget {
  const Cancelled({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchOrders('Cancelled', 'Completed');

    List<ClientOrders> orders = hookResults.data;
    final isLoading = hookResults.isLoading;

    if (isLoading) {
      return const FoodsListShimmer();
    }

    return SizedBox(
      height: height * 0.8,
      child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, i) {
            return ClientOrderTile(food: orders[i].orderItems[0]);
          }),
    );
  }
}
