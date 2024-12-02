import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';
import 'package:plant_shop/pages/checkout/widgets/address_step/address_list.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class AddressStep extends StatefulWidget {
  const AddressStep({super.key});

  @override
  State<AddressStep> createState() => _AddressStepState();
}

class _AddressStepState extends State<AddressStep> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                AddressList(
                  onAddressPressed:
                      context.read<CheckoutPageCubit>().onAddressPressed,
                ),
              ],
            ),
          ),
          buildAddNewAddress(),
        ],
      ),
    );
  }

  Widget buildAddNewAddress() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: '+ Add New Addresss',
        onPressed: () {},
      ),
    );
  }
}
