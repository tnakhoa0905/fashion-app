import 'package:fashion_app/core/utils/values.dart';
import 'package:fashion_app/view/widgets/common/shimmer_effect.dart';
import 'package:fashion_app/view/widgets/state_renderer/skeleton_widgets.dart';
import 'package:flutter/material.dart';

class LoadingProductCategoryGirdview extends StatelessWidget {
  const LoadingProductCategoryGirdview({
    super.key,
    this.shrinkWrap = false,
  });
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      enabled: true,
      child: GridView.builder(
        shrinkWrap: shrinkWrap,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: AppPadding.p20,
          right: AppPadding.p20,
          top: AppPadding.p20 - 10,
        ),
        scrollDirection: Axis.vertical,
        itemCount: 12,
        itemBuilder: (context, index) {
          return const CustomSkeletonWidget();
        },
      ),
    );
  }
}
