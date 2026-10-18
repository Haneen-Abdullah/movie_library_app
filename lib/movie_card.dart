import 'package:flutter/material.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final int discount;
  final VoidCallback onDiscountTap;
  final bool isGrid;

  const MovieCard({
    super.key,
    required this.movie,
    required this.discount,
    required this.onDiscountTap,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isGrid
          ? _buildGridCard(context)
          : _buildListCard(context),
    );
  }


  Widget _buildGridCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildPoster(context),
        ),
        _buildMovieDetails(context),
      ],
    );
  }


  Widget _buildListCard(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          height: double.infinity,
          child: _buildPoster(context),
        ),
        Expanded(
          child: _buildMovieDetails(context),
        ),
      ],
    );
  }


  Widget _buildPoster(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          movie.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(
                  Icons.movie,
                  size: 55,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),


        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 65,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.75),
                ],
              ),
            ),
          ),
        ),


        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  size: 13,
                  color: Colors.black,
                ),
                const SizedBox(width: 3),
                Text(
                  movie.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),


        Positioned(
          top: 2,
          right: 2,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.black45,
            ),
          ),
        ),

        Positioned(
          bottom: 8,
          left: 8,
          child: Text(
            movie.year.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildMovieDetails(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),


          Text(
            movie.genre,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 8),


          SizedBox(

            width: double.infinity,
            child: Material(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: onDiscountTap,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 8,
                  ),
                  child: Center(
                    child: Text(
                      '$discount% OFF',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),

                    ),
                  ),
                ),

              ),
            ),
          ),


        ],
      ),
    );
  }
}