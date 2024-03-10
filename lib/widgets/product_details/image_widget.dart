import 'package:flutter/widgets.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final String imageKey;
  const ImageWidget({
    required this.image,
    super.key,
    required this.imageKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        // image: DecorationImage(
        //   image: NetworkImage(
        //     image,
        //     scale: 2,
        // ),
        // ),
        color: Color(0xFFF2F3F2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Hero(
        tag: imageKey,
        child: Image.network(image),
      ),
    );
  }
}
