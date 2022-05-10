import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRating extends StatelessWidget {
  final Function(double)? onRateUpdate;
  final Axis direction;
  final int itemCount;
  final bool isRating;
  final double? numberRate;
  final double initialRating;
  final double minRating;

  const AppRating(
      {Key? key,
      this.onRateUpdate,
      this.direction = Axis.horizontal,
      this.itemCount = 5,
      this.isRating = false,
      this.numberRate = 1,
      this.initialRating = 1,
      this.minRating = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isRating) {
      return RatingBarIndicator(
        rating: numberRate!,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: itemCount,
        itemSize: 20.0,
        direction: direction,
      );
    }
    return RatingBar.builder(
      wrapAlignment: WrapAlignment.start,
      itemSize: 20,
      updateOnDrag: true,
      initialRating: initialRating,
      minRating: minRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: itemCount,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        onRateUpdate!(rating);
      },
    );
  }
}
