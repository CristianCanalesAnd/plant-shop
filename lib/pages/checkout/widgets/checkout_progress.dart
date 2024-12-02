import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../enums/checkout_progress_step.dart';

class CheckoutProgress extends StatefulWidget {
  const CheckoutProgress({super.key});

  @override
  State<CheckoutProgress> createState() => _CheckoutProgressState();
}

class _CheckoutProgressState extends State<CheckoutProgress> {
  double thickness = 5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        CheckoutProgressStep step = state.step;
        var cubit = context.read<CheckoutPageCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SfLinearGauge(
            minimum: 0,
            maximum: 2,
            interval: 1,
            showTicks: false,
            labelOffset: 30,
            axisTrackStyle: LinearAxisTrackStyle(
              color: AppColors.gray10Percent,
              thickness: thickness,
            ),
            ranges: [
              if (step.value > 0)
                LinearGaugeRange(
                  startValue: 0,
                  endValue: 1,
                  color: AppColors.primary500,
                  position: LinearElementPosition.cross,
                  startWidth: thickness,
                  endWidth: thickness,
                ),
              if (step.value > 1)
                LinearGaugeRange(
                  startValue: 1,
                  endValue: 2,
                  color: AppColors.primary500,
                  position: LinearElementPosition.cross,
                  startWidth: thickness,
                  endWidth: thickness,
                ),
            ],
            markerPointers: CheckoutProgressStep.values.map(
              (s) {
                bool isActive = s.value <= step.value;

                return LinearWidgetPointer(
                  value: s.value.toDouble(),
                  enableAnimation: false,
                  child: buildIcon(
                    step: s,
                    isActive: isActive,
                    onPressed: () => cubit.onCheckoutProgressStepPressed(s),
                  ),
                );
              },
            ).toList(),
            onGenerateLabels: () {
              return CheckoutProgressStep.values
                  .map(
                    (t) => LinearAxisLabel(
                      text: t.localizedTitle,
                      value: t.value.toDouble(),
                    ),
                  )
                  .toList();
            },
            axisLabelStyle: AppTextStyle.regular(
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  Widget buildIcon({
    required CheckoutProgressStep step,
    required bool isActive,
    required Function() onPressed,
  }) {
    Color iconColor = isActive ? AppColors.primary500 : AppColors.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.gray5Percent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          step.image,
          color: iconColor,
          height: 30,
        ),
      ),
    );
  }
}
