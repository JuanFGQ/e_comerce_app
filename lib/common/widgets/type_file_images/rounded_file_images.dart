// import 'package:e_comerce_app/utils/constants/colors.dart';
// import 'package:e_comerce_app/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';

// class JFileImage extends StatelessWidget {
//   const TRoundedImage({
//     super.key,
//     this.width = 350,
//     this.height = 350,
//     this.borderRadius = TSizes.md,
//     required this.imageUrl,
//     this.applyImageRadius = true,
//     this.border,
//     this.backGroundColor = TColors.light,
//     this.fit = BoxFit.contain,
//     this.padding,
//     this.isNetworkImage = false,
//     this.onPressed,
//     this.isLocalImage = false,
//   });

//   final double? width, height;
//   final double borderRadius;
//   final bool? isLocalImage;

//   final File imageUrl;
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final Color backGroundColor;
//   final BoxFit? fit;
//   final EdgeInsetsGeometry? padding;
//   final bool isNetworkImage;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         decoration: BoxDecoration(
//           border: border,
//           color: backGroundColor,
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: ClipRRect(
//             borderRadius: applyImageRadius
//                 ? BorderRadius.circular(TSizes.md)
//                 : BorderRadius.zero,
//             child: Image(
//                 fit: fit,
//                 image: isNetworkImage
//                     ? NetworkImage(imageUrl)
//                     : AssetImage(imageUrl) as ImageProvider)),
//       ),
//     );
//   }
// }
