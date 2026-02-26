import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
  Widget _buildTrailing() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return IconButton(
          onPressed: controller.startDownload,
          icon: const Icon(Icons.download),
        );
      case DownloadStatus.downloading:
        return IconButton(
          onPressed: null,
          icon: Icon(Icons.downloading)
        );
      case DownloadStatus.downloaded:
        return const Icon(Icons.folder, color: Colors.grey);
    }
  }

  Widget _buildSubtitle(){
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return const SizedBox.shrink();

      case DownloadStatus.downloading:
        final downloadedMB = (controller.progress * controller.ressource.size)
            .toStringAsFixed(1);
        final totalMB = controller.ressource.size;
        final percent = (controller.progress * 100).toStringAsFixed(1);
        return Text(
          '$percent % completed - $downloadedMB of $totalMB MB',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        );

      case DownloadStatus.downloaded:
        final totalMB = controller.ressource.size;
        return Text(
          '100.0 % completed - $totalMB of $totalMB MB',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            title: Text(controller.ressource.name),
            subtitle: _buildSubtitle(),
            trailing: _buildTrailing(),
          ),
        );
      },
    );

    // TODO
  }
}
