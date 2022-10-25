import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'controller.dart';
import 'image.privew.page.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi image picker')),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.controller.pickImages,
              child: Text('select images'),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: widget.controller.images.length,
                itemBuilder: (context, index) {
                  XFile image = widget.controller.images[index];
                  File file = File(image.path);
                  return ListTile(
                    title: Text(image.name),
                    leading: Image.file(file),
                    subtitle: Text(
                        '${(file.lengthSync() / 1024).toStringAsFixed(2)} KB'),
                    onTap: () {
                      Get.to(ImagePreview(image: image));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
