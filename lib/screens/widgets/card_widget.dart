import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
   
   final List<dynamic>movies;
  
  const CardSwiper(
    {
      Key? key,
      required this.movies
      }
      ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    const base = "https://image.tmdb.org/t/p/w500";

    return Container(
      width: double.infinity,
      height: 300,
      child: Swiper(
        itemCount: movies.length,
        itemWidth: size.width *0.6,
        itemHeight: size.height *0.4,
        layout: SwiperLayout.STACK,
        itemBuilder: ( _, int index){

          final movie = movies[index];
          final imageUrl = base + movie['poster_path'];

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage("assets/placeholder.png"), 
              image: NetworkImage(imageUrl)
            ),
          );  
        },
      ),
    );
  }
}