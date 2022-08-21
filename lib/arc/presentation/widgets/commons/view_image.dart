import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'custom_app_bar.dart';
import 'dialog.dart';

class ViewImageScreen extends StatefulWidget {
  final List<String> image;
  final int? index;

  const ViewImageScreen({
    Key? key,
    required this.image,
    this.index,
  }) : super(key: key);

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  late PageController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.index ?? 0);
    _index = widget.index ?? 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: CustomAppBar.withLeading(
          title: '${_index + 1}/${widget.image.length}'),
      body: Center(
        child: GestureDetector(
          onVerticalDragEnd: (_) => navigator.pop(),
          child: Hero(
            tag: 'img',
            child: PhotoViewGallery.builder(
              backgroundDecoration: BoxDecoration(color: theme.backgroundColor),
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) =>
                  PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.image[index]),
                      initialScale: PhotoViewComputedScale.contained),
              itemCount: widget.image.length,
              loadingBuilder: (context, event) => const Center(
                  child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator())),
              pageController: _controller,
              onPageChanged: (index) {
                _index = index;
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
