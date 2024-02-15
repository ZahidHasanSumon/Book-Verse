import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/custom_themes/appbar.dart';
import '../widget/downloaded_file_card_vertical.dart';
import '../widget/grid_layout.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  late List<File> downloadedFiles = [];

  @override
  void initState() {
    super.initState();
    fetchDownloadedFiles();
  }

  Future<void> fetchDownloadedFiles() async {
    final Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      setState(() {
        downloadedFiles = directory.listSync().whereType<File>().toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const SAppBar(
        title: Text('Downloads'),
      ),
      body: downloadedFiles.isEmpty
          ? const Center(
        child: Text('No downloaded files'),
      )
          : SGridLayout(
        itemCount: downloadedFiles.length,
        itemBuilder: (context, index) {
          final file = downloadedFiles[index];
          final String fileName = file.path.split('/').last;
          return DownloadedFileCardVertical(fileName: fileName, filePath: file.path,);
        },
      ),
    );
  }
}
