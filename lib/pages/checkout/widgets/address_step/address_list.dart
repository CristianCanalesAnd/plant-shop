import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/data/data.dart';
import 'package:plant_shop/models/address.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';

import 'address_widget.dart';

class AddressList extends StatelessWidget {
  final Function(Address) onAddressPressed;

  const AddressList({
    super.key,
    required this.onAddressPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        return Column(
          children: listAddress.map(
            (address) {
              bool isActive = address.id == state.address.id;

              return AddressWidget(
                address: address,
                isActive: isActive,
                onPressed: () => onAddressPressed(address),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
