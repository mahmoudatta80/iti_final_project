import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/get_all_favourites/get_all_favourites_cubit.dart';
import 'package:iti_final_project/features/favourites/presentation/ui/widgets/favourite_item.dart';

class FavouritesListView extends StatelessWidget {
  const FavouritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetAllFavouritesCubit, GetAllFavouritesState>(
        builder: (context, state) {
          if (state is GetAllFavouritesSuccess) {
            if (state.favourites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.black54,
                      size: 40,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Favourites is empty',
                      style: MyStyles.font22BlackRegular,
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => FavouriteItem(
                favouriteModel: state.favourites[index],
              ),
              itemCount: state.favourites.length,
            );
          } else if (state is GetAllFavouritesFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: MyStyles.font22BlackRegular,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.mainBlue,
              ),
            );
          }
        },
      ),
    );
  }
}
