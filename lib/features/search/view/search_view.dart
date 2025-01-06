import 'package:assignment2/features/search/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment2/widgets/card/estate_details_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final searchViewModel = context.read<SearchViewModel>();
      searchViewModel.fetchSearchResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchViewModel = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search results"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search estates, apartments...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (query) {
                searchViewModel.updateSearchQuery(query); // Update search query
              },
            ),
            const SizedBox(height: 16),
            searchViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : searchViewModel.searchResults.isEmpty
                    ? const Center(child: Text("No estates found."))
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: searchViewModel.searchResults.length,
                          itemBuilder: (context, index) {
                            final estate = searchViewModel.searchResults[index];
                            return EstateDetailsCard(
                              title: estate.title,
                              location: estate.location,
                              price: '\$${estate.price}', // Convert the int to a formatted string
                              imagePath: estate.imagePath,
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}