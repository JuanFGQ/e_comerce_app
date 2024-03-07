import 'dart:io';

import 'package:flutter/material.dart';

Widget getImage(String? picture) {
  if (picture != null && picture.startsWith('http')) {
    return FadeInImage(
      image: NetworkImage(picture),
      placeholder: const AssetImage('assets/jar-loading.gif'),
      fit: BoxFit.cover,
    );
  }

  return Image.file(
    File(picture!),
    fit: BoxFit.cover,
  );
}
