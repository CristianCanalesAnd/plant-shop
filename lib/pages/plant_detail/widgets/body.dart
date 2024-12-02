import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/enums/pot_color.dart';
import 'package:plant_shop/enums/pot_type.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/models/plant.dart';
import 'package:plant_shop/pages/plant_detail/widgets/rating.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'add_to_cart_container.dart';
import 'specifications.dart';

class Body extends StatefulWidget {
  final GroupPlant groupPlant;

  const Body({
    super.key,
    required this.groupPlant,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double? heightImage;
  PotType _type = PotType.meyer;
  PotColor _potColor = PotColor.white;

  GroupPlant get groupPlant => widget.groupPlant;
  Pot get pot => groupPlant.pot(_type);
  Plant get plant => groupPlant.toPlant(_type, _potColor);

  int _quantity = 1;

  @override
  void initState() {
    setState(() {
      _type = groupPlant.pots.keys.first;
      _potColor = groupPlant.pot(_type).variants.keys.first;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildImageContainer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      buildPots(),
                      const SizedBox(height: 15),
                      buildNameLabel(),
                      const Rating(),
                      const SizedBox(height: 15),
                      const SizedBox(height: 15),
                      buildDescriptionLabel(),
                      buildDivider(),
                      const Specifications(),
                      const SizedBox(height: 50),
                      AddToCartContainer(
                        quantity: _quantity,
                        price: plant.price,
                        addItem: addItem,
                        removeItem: removeItem,
                        onAddToCartPressed: _onAddToCartPressed,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageContainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildImage(),
        Positioned(
          bottom: 10,
          child: buildColors(),
        )
      ],
    );
  }

  Widget buildImage() {
    return Image.asset(
      plant.image,
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }

  Widget buildColors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pot.variants.entries
          .map((p) => buildColorOption(potColor: p.key))
          .toList(),
    );
  }

  Widget buildColorOption({required PotColor potColor}) {
    double size = 30;
    return GestureDetector(
      onTap: () {
        setState(() {
          _potColor = potColor;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: potColor.color,
          shape: BoxShape.circle,
          border: potColor == _potColor
              ? Border.all(
                  width: 3,
                  color: AppColors.option2,
                  style: BorderStyle.solid,
                )
              : null,
        ),
      ),
    );
  }

  Widget buildPots() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: groupPlant.pots.keys
              .map((p) => buildPotOption(potType: p))
              .toList(),
        ),
      ),
    );
  }

  Widget buildPotOption({required PotType potType}) {
    bool isSelected = potType == _type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _type = potType;
          _potColor = pot.variants.keys.first;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.option1 : AppColors.gray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          potType.localizedTitle,
          style: AppTextStyle.regular(
            color: isSelected ? AppColors.dark : AppColors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildNameLabel() {
    return Text(
      plant.name,
      style: AppTextStyle.bold(
        fontSize: 26,
      ),
    );
  }

  Widget buildDescriptionLabel() {
    return Text(
      plant.description,
      style: AppTextStyle.regular(
        fontSize: 18,
      ),
    );
  }

  Widget buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: AppColors.gray,
      ),
    );
  }

  // Functions
  void addItem() {
    setState(() {
      _quantity++;
    });
  }

  void removeItem() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _onAddToCartPressed() {
    context.read<AppStateCubit>().addItemToCart(context, plant, _quantity);
  }
}
