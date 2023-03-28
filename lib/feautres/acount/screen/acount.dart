import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? cameraFile;
  VideoPlayerController? videoPlayerController;

  void cameraFromGallery() async {
    XFile? video = await ImagePicker().pickVideo(source: ImageSource.camera);

    cameraFile = File(video!.path);
    videoPlayerController = VideoPlayerController.file(cameraFile!)
      ..initialize().then((value) {
        setState(() {});
        videoPlayerController?.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
               
                color: Colors.orange,
                child: InkWell(
                  onTap: () {
                    cameraFromGallery();
                  },
                  child: AspectRatio(
                    aspectRatio: videoPlayerController?.value.aspectRatio ?? 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: videoPlayerController != null
                          ? VideoPlayer(
                              videoPlayerController!,
                            )
                          : Container(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
