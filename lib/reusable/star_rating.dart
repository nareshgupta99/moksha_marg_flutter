import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final ValueChanged<double>? onRatingChanged;
  final Color color;
  final double size;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0.0,
    this.onRatingChanged,
    this.color = Colors.amber,
    this.size = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        double currentStarValue = index + 1.0;

        return GestureDetector(
          onTap: () {
            if (onRatingChanged != null) {
              onRatingChanged!(currentStarValue);
            }
          },
          child: Icon(
            _getStarIcon(index),
            color: color,
            size: size,
          ),
        );
      }),
    );
  }

  /// Determines which star icon to display
  IconData _getStarIcon(int index) {
    double fractionalPart = rating - index;

    if (fractionalPart >= 1) {
      // Full star
      return Icons.star;
    } else if (fractionalPart > 0) {
      // Half star for fractional value
      return Icons.star_half;
    } else {
      // Empty star
      return Icons.star_border;
    }
  }
}
