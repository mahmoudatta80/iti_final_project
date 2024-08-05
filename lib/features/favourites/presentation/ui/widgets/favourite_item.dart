import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/features/favourites/data/models/favourite_model.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/get_all_favourites/get_all_favourites_cubit.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/toggle_favourite/toggle_favourite_cubit.dart';

class FavouriteItem extends StatelessWidget {
  final FavouriteModel favouriteModel;

  const FavouriteItem({super.key, required this.favouriteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        bottom: 20.h,
        start: 20.w,
        end: 20.w,
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: favouriteModel.image,
            fit: BoxFit.fill,
            height: 120.h,
            width: 120.h,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favouriteModel.title,
                  style: MyStyles.font18BlackSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$ ${favouriteModel.price}',
                  style: MyStyles.font22BlackRegular,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          BlocConsumer<ToggleFavouriteCubit, ToggleFavouriteState>(
            listener: (context, state) {
              if (state is ToggleFavouriteSuccess) {
                context.read<GetAllFavouritesCubit>().getAllFavourites();
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<ToggleFavouriteCubit>().toggleFavourite(
                        favouriteModel,
                        context.read<GetAllFavouritesCubit>().isFavourites,
                      );
                },
                child: const FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.red,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
