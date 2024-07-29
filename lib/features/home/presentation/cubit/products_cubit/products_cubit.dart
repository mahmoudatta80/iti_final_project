import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/home/data/repo/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;

  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  Future getProducts() async {
    emit(ProductsLoading());
    var response = await homeRepo.getProducts();

    if (isClosed) {
      return;
    }

    response.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}
