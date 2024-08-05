import 'package:flutter/material.dart';
import 'package:iti_final_project/features/favourites/presentation/ui/widgets/favourites_list_view.dart';
import 'package:iti_final_project/features/favourites/presentation/ui/widgets/favourites_tap_bar.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FavouritesTapBar(),
            FavouritesListView(),
          ],
        ),
      ),
    );
  }
}
