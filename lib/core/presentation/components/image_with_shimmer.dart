import 'package:movies_tv/core/resources/all_import.dart';

class ImageWithShimmer extends StatelessWidget {
  const ImageWithShimmer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: height,
          color: AppColors.secondaryText,
        ),
      ),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
        color: AppColors.error,
      ),
    );
  }
}
