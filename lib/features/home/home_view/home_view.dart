import 'package:assignment2/services/navigation_serv.dart';
import 'package:assignment2/widgets/card/estate_details_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_viewmodel/home_view_model.dart';
import 'package:assignment2/routers/routes_const.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final homeViewModel = context.read<HomeViewModel>();
    homeViewModel.fetchFeaturedEstates();
  }

  void _onTabSelected(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        NavigationServ().navigateTo(RoutesConst.searchScreen);
        break;
      case 2:
        NavigationServ().navigateTo(RoutesConst.profileScreen);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Location.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Your Location',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/Notification.png',
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {
                    NavigationServ().navigateTo(RoutesConst.notificationMessagesScreen);
                  },
                ),

                IconButton(
                  icon: Image.asset(
                    'assets/Prof.png',
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {
                    // Navigate to Profile Screen
                    NavigationServ().navigateTo(RoutesConst.profileScreen);
                  },
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search House, Apartment, etc.',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/Search.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: homeViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : homeViewModel.featuredEstates.isEmpty
                    ? Center(
                        child: Text(
                          "No featured estates available.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : ListView.builder(
                        itemCount: homeViewModel.featuredEstates.length,
                        itemBuilder: (context, index) {
                          final estate = homeViewModel.featuredEstates[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: EstateDetailsCard(
                              title: estate.title,
                              location: estate.location,
                              price: estate.price,
                              imagePath: estate.imagePath,
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}