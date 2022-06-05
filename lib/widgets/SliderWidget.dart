import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNUcdeoNIX5L9ejExTRI1kEKYkf7dDOB3lfQ&usqp=CAU",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAiF6S8347YK7kDqGnuK3NAKfPFLGR8BkBtQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ716-tPXl2ekvYmsK999lUuWztrBsKv9lBw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxjkk_Al_G5N33-u683hhzq8gSWJx4BJBRRg&usqp=CAU'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 200,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          reverse: false,
          aspectRatio: 3.0,
        ),
        itemBuilder: (context, i, id) {
          //for onTap to redirect to another screen
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white,
                  )),
              //ClipRRect for image border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageList[i],
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
