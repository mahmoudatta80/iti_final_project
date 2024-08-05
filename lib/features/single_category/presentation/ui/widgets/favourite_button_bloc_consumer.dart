import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/features/favourites/data/models/favourite_model.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/get_all_favourites/get_all_favourites_cubit.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/toggle_favourite/toggle_favourite_cubit.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';

class FavouriteButtonBlocConsumer extends StatelessWidget {
  final ProductModel productModel;

  const FavouriteButtonBlocConsumer({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToggleFavouriteCubit, ToggleFavouriteState>(
      listener: (context, state) {
        if (state is ToggleFavouriteSuccess) {
          context.read<GetAllFavouritesCubit>().getAllFavourites();
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            FavouriteModel favouriteModel = FavouriteModel(
              id: productModel.id,
              price: productModel.price as num,
              title: productModel.title,
              description: productModel.description,
              image: productModel.image,
              category: productModel.category,
            );
            context.read<ToggleFavouriteCubit>().toggleFavourite(
                  favouriteModel,
                  context.read<GetAllFavouritesCubit>().isFavourites,
                );
          },
          child: context
                      .read<GetAllFavouritesCubit>()
                      .isFavourites[productModel.id] ==
                  true
              ? const Icon(
                  FontAwesomeIcons.solidHeart,
                  color: MyColors.mainBlue,
                )
              : const Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                ),
        );
      },
    );
  }
}
