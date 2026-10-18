import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGridView = false;

  String searchText = '';

  int discount = 20;

  List<Movie> get filteredMovies {
    final query = searchText.trim().toLowerCase();

    return movies.where((movie) {
      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();
  }

  void decreaseDiscount() {
    setState(() {
      if (discount > 0) {
        discount--;
      } else {
        discount = 20;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Library',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: isGridView ? 'List View' : 'Grid View',
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon: Icon(
              isGridView ? Icons.view_list : Icons.grid_view,
            ),
          ),

        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Text(
                  'Movies (${results.length})',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],

            ),
          ),

          Expanded(
            child: results.isEmpty
                ? const Center(
              child: Text(
                'No movies found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
                : isGridView
                ? GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                16,
              ),
              itemCount: results.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: results[index],
                  discount: discount,
                  onDiscountTap: decreaseDiscount,
                  isGrid: true,
                );
              },
            )
                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                16,
              ),
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 14,
                  ),
                  child: SizedBox(
                    height: 170,
                    child: MovieCard(
                      movie: results[index],
                      discount: discount,
                      onDiscountTap: decreaseDiscount,
                      isGrid: false,
                    ),
                  ),
                );

              },
            ),
          ),

        ],
      ),
    );
  }


}