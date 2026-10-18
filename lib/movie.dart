class Movie {
final String title;
final String genre;
final int year;
final double rating;
final String image;


const Movie({
required this.title,
required this.genre,
required this.year,
required this.rating,
required this.image,
});
}

const List<Movie> movies = [
Movie(
title: 'Spiderman',
genre: 'Action',
year: 2002,
rating: 8.5,
image: 'assets/posters/Spiderman.jpg',
),

Movie(
title: 'Interstellar',
genre: 'Sci-Fi',
year: 2014,
rating: 8.7,
image: 'assets/posters/interstellar.jpg',
),

Movie(
title: 'The Dark Knight',
genre: 'Action',
year: 2008,
rating: 9.0,
image: 'assets/posters/dark_knight.jpg',
),

Movie(
title: 'Beauty and the Beast',
genre: 'Romance',
year: 2017,
rating: 7.1,
image: 'assets/posters/beauty and the beast.jpg',
),

Movie(
title: 'The pale blue eye',
genre: 'mystery,crime',
year: 2022,
rating: 6.6,
image: 'assets/posters/the_pale-blue_eye.jpg',
),


Movie(
title: 'Toy Story',
genre: 'Animation',
year: 1995,
rating: 8.3,
image: 'assets/posters/toy_story.jpg',
),


 Movie(
    title: 'Maleficent',
    genre: 'Animation',
    year: 2014,
    rating: 6.9,
    image: 'assets/posters/Maleficent.jpg',
  ),


  Movie(
    title: 'Taxi Driver',
    genre: 'crime',
    year: 1976,
    rating: 8.2,
    image: 'assets/posters/taxi_driver.jpg',
  ),


];

