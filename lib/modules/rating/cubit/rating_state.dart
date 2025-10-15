part of 'rating_cubit.dart';

enum RatingContentStatus { empty, filled, error }

class RatingState {
  final Product? product;
  final int stars;
  final String review;
  final RatingContentStatus contentStatus;
  final bool loading;
  RatingState({
    required this.product,
    required this.stars,
    required this.review,
    required this.loading,
    required this.contentStatus,
  });

  RatingState.init({this.product})
    : review = '',
      stars = 0,
      contentStatus = RatingContentStatus.empty,
      loading = false;

  RatingState copyWith({
    Product? product,
    String? review,
    int? stars,
    bool? loading,
    RatingContentStatus? contentStatus,
  }) {
    return RatingState(
      product: product ?? this.product,
      stars: stars ?? this.stars,
      review: review ?? this.review,
      contentStatus: contentStatus ?? this.contentStatus,
      loading: loading ?? this.loading,
    );
  }
}
