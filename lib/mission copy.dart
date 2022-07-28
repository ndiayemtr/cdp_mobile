import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

final _images = [
  'assets/cdp_cest_quoi.jpg',
  'assets/mission_de_veille.jpg',
  'assets/mission_de_veille.jpg',
  'assets/mission_instruction.jpg',
  'assets/mission_de_control.jpg',
];

class Mission extends StatefulWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  State<Mission> createState() => _Missiontate();
}

class _Missiontate extends State<Mission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: InkWell(
          child: Image.asset(
            _images[0],
            height: 230,
            width: 400,
          ),
          onTap: OpenMission,
        ),
      ),
    );
  }

  void OpenMission() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GalleryWidget(
          urlImages: _images,
          index: 2,
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  final PageController pageController;
  final List<String> urlImages;
  final int index;

  GalleryWidget({
    required this.urlImages,
    this.index = 0,
  }) : pageController = PageController(
          initialPage: index,
        );

  @override
  State<StatefulWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int index = widget.index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PhotoViewGallery.builder(
            pageController: widget.pageController,
            itemCount: widget.urlImages.length,
            builder: (context, index) {
              final urlImage = widget.urlImages[index];

              return PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(urlImage),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
              );
            },
            onPageChanged: (index) => setState(() {
              this.index = index;
            }),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Image ${index + 1} / ${widget.urlImages.length}',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
