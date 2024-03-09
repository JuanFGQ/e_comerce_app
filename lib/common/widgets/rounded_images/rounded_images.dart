import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JRoundedImage extends StatelessWidget {
  const JRoundedImage({
    super.key,
    this.width = 350,
    this.height = 350,
    this.borderRadius = JSizes.md,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backGroundColor = JColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.localImage = false,
  });

  final double? width, height;
  final double borderRadius;
  final bool localImage;

  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backGroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backGroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(JSizes.md)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    progressIndicatorBuilder: (context, url, progress) =>
                        JShimmerEffect(width: width!, height: height!),
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error))
                : Image(
                    fit: fit,
                    image: localImage
                        ? Image.file(File(imageUrl), fit: fit).image
                        : AssetImage(imageUrl))),
      ),
    );
  }
}

  // Image.file(
                //     File(imageUrl),
                //     fit: fit,
                //   )