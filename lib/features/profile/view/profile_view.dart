import 'package:assignment2/utils/images_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.watch<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings click
            },
          ),
        ],
      ),
      body: profileViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture and Name Section
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(ImagesConst.prof),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      profileViewModel.userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      profileViewModel.email,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // Stats Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStats(
                          profileViewModel.listings.toString(),
                          "Listings",
                        ),
                        _buildStats(
                          profileViewModel.sold.toString(),
                          "Sold",
                        ),
                        _buildStats(
                          profileViewModel.reviews.toString(),
                          "Reviews",
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Tab Section
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          TabBar(
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue.shade100,
                            ),
                            labelColor: Colors.blue,
                            unselectedLabelColor: Colors.black54,
                            tabs: const [
                              Tab(text: "Transaction"),
                              Tab(text: "Listings"),
                              Tab(text: "Sold"),
                            ],
                          ),
                          SizedBox(
                            height: 300,
                            child: TabBarView(
                              children: [
                                _buildTransactionTab(profileViewModel),
                                _buildListingsTab(),
                                _buildSoldTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildStats(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildTransactionTab(ProfileViewModel profileViewModel) {
    return ListView.builder(
      itemCount: profileViewModel.transactions.length,
      itemBuilder: (context, index) {
        final transaction = profileViewModel.transactions[index];
        return _buildTransactionCard(
          transaction.title,
          transaction.date,
          transaction.imagePath,
          transaction.tag,
        );
      },
    );
  }

  Widget _buildListingsTab() {
    return ListView.builder(
      itemCount: 10, // Example count for listings
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Text((index + 1).toString()),
          ),
          title: Text("Listing ${index + 1}"),
          subtitle: Text(_generateRandomText()),
        );
      },
    );
  }

  Widget _buildSoldTab() {
    return ListView.builder(
      itemCount: 10, // Example count for sold items
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.shade100,
            child: Text((index + 1).toString()),
          ),
          title: Text("Sold Item ${index + 1}"),
          subtitle: Text(_generateRandomText()),
        );
      },
    );
  }

  Widget _buildTransactionCard(
      String title, String date, String imagePath, String tag) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tag,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  // Generate random text for Listings and Sold tabs
  String _generateRandomText() {
    const texts = [
      "Great opportunity awaits!",
      "Sold like hotcakes!",
      "Top-notch listing.",
      "Quick turnover item!",
      "Another successful transaction!",
      "Exciting deal made.",
      "Perfect for your next move.",
      "Highly recommended by buyers.",
      "Fast selling product.",
      "Your success story starts here."
    ];
    return texts[DateTime.now().millisecond % texts.length];
  }
}
