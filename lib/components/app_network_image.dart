import 'package:docsify/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    this.source,
    this.style = "none",
    this.fit = BoxFit.contain,
    this.decoration,
  }) : super(key: key);

  final String? source;
  final String? style;
  final BoxFit fit;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return source == null || source!.isEmpty || !source!.startsWith('http')
        ? CachedNetworkImage(
            imageUrl:
                "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png",
            placeholder: (context, url) => Center(
              widthFactor: 2,
              heightFactor: 2,
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: const CircularProgressIndicator(
                  color: colorBlue80,
                  strokeWidth: 2.0,
                  backgroundColor: colorWhite,
                ),
              ),
            ),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png",
            ),
          )
        : CachedNetworkImage(
            imageUrl: source ?? "",
            placeholder: (context, url) => Center(
              widthFactor: 2,
              heightFactor: 2,
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: const CircularProgressIndicator(
                  color: colorPrimaryCTV24h,
                  strokeWidth: 2.0,
                ),
              ),
            ),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png",
            ),
          );
  }
}
