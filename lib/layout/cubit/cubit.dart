import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:orange/layout/cubit/states.dart';
import 'package:orange/models/carts_model.dart';
import 'package:orange/models/product.dart';
import 'package:orange/models/tools.dart';
import 'package:orange/modules/blogs/blogs_screen.dart';
import 'package:orange/modules/home/home_screen.dart';
import 'package:orange/modules/notifications/notifications_screen.dart';
import 'package:orange/modules/profile/profile_screen.dart';
import 'package:orange/modules/scan/scan_screen.dart';
import 'package:orange/shared/components/constants.dart';
import 'package:orange/shared/network/local/sql_helper.dart';
import 'package:orange/shared/network/remote/dio_helper.dart';
import 'package:orange/shared/network/remote/end_points.dart';
import '../../models/blogs.dart';
import '../../models/plants.dart';
import '../../models/seeds.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  MobileScannerController cameraController=MobileScannerController();

  List<Widget> screens = [
    const BlogsScreen(),
    const ScanScreen(),
     const HomeScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  int currentPage = 2;
  void changeNavBar(int index, BuildContext context) {
    if(index!=4){
      currentPage = index;
    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProfileScreen()));
    }
    emit(ChangeNavBarState());
  }

   getFreeSeed(String address){
    emit(GetFreeSeedLoadingsState());
    DioHelper.postData(url: FREE_SEED, data: {
      'address':address,
    },
      token: accessToken,
    ).then((value){

      emit(GetFreeSeedSuccessState());
    }).catchError((error){
      emit(GetFreeSeedErrorState());
    });
  }

  ProductModel? productModel;
   getProducts() async{
    emit(GetProductsLoadingState());
    DioHelper.getData(path: PRODUCTS, token: accessToken, query: null)
        .then((value) {
      print(value.data);
      productModel = ProductModel.fromJson(value.data);
      emit(GetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductsErrorState());
    });
  }

  ToolsModel? toolModel;
   getTools() async{
    emit(GetToolsLoadingState());
    DioHelper.getData(path: TOOLS, token: accessToken, query: null)
        .then((value) {
      toolModel = ToolsModel.fromJson(value.data);
      print(toolModel!.message);
      print(toolModel!.type);
      print(toolModel!.data![0].imageUrl);
      emit(GetToolsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetToolsErrorState());
    });
  }

  SeedsModel? seedsModel;
   getSeeds() async{
    emit(GetSeedsLoadingState());
    DioHelper.getData(path: SEEDS, token: accessToken, query: null)
        .then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
      print(seedsModel!.message);
      print(seedsModel!.type);
      print(seedsModel!.data![0].imageUrl);
      emit(GetSeedsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSeedsErrorState());
    });
  }

  PlantsModel? plantsModel;
   getPlants()async {
    emit(GetPlantsLoadingState());
    DioHelper.getData(path: PLANTS, token: accessToken, query: null)
        .then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
      // print(seedsModel!.message);
      // print(seedsModel!.type);
      print('https://lavie.orangedigitalcenteregypt.com${plantsModel!.data![12].imageUrl}');
      emit(GetPlantsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPlantsErrorState());
    });
  }

  void addToCarts({
    required String name,
    required String imageUrl,
    required String type,
    required String id,
    required int quantity,
    int? price,
  }) {
    emit(AddToCartsLoadingState());
    CartsModel cartModel = CartsModel(
      name: name,
      productId: id,
      imageUrl: imageUrl,
      type: type,
      price: price,
      quantity: quantity,
    );
    bool notFound=true;
    carts.forEach((element) {
      if(element.productId==id) {
        notFound=false;
      }
    });
    if(notFound){
      SqlHelper.insertCart(cartModel).then((value) {
        getCartById(cartModel.productId!);
        emit(AddToCartsSuccessState());
      }).catchError((error) {
        emit(AddToCartsErrorState());
      });
    }

  }

  List<CartsModel> carts = [];
  void getCarts() {
    emit(GetCartsLoadingState());
    carts = [];
    SqlHelper.getCarts().then((value) {
      print(value.toString());
      for (var element in value!) {
        carts.add(CartsModel.fromTable(element));
      }
      emit(GetCartsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCartsErrorState());
    });
  }

  void getCartById(String productId) {
    emit(GetCartsLoadingState());
    SqlHelper.getCartItem(productId).then((value) {
      print(value.toString());
      for (var element in value!) {
        carts.add(CartsModel.fromTable(element));
      }
      emit(GetCartsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCartsErrorState());
    });
  }

  void deleteCart(String productId) {
    emit(DeleteCartLoadingState());
    SqlHelper.delete(productId).then((value) {
      print(value);
      getCarts();
      emit(DeleteCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteCartErrorState());
    });
  }

  void increaseCartQuantity(var model) {
    ++model.quantity;
SqlHelper.update(model.productId!, model.quantity);
emit(UpdateCartSuccessState());
  }

  void decreaseCartQuantity(var model) {
    --model.quantity;
    SqlHelper.update(model.productId, model.quantity);
    emit(UpdateCartSuccessState());
  }

  BlogsModel? blogModel;
  List allBlogs = [];
   getBlogs()async {
    emit(GetBlogsLoadingState());
    DioHelper.getData(path: BLOGS, token: accessToken, query: null)
        .then((value) {
      blogModel = BlogsModel.fromJson(value.data);
      allBlogs.addAll(blogModel!.data!.plants!.toList());
      allBlogs.addAll(blogModel!.data!.tools!.toList());
      allBlogs.addAll(blogModel!.data!.seeds!.toList());
      print(allBlogs);

      // print(seedsModel!.message);
      // print(seedsModel!.type);
      //print('https://lavie.orangedigitalcenteregypt.com${plantsModel!.data![12].imageUrl}');
      emit(GetBlogsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBlogsErrorState());
    });
  }

 void changeQuizValidation()async{
    emit(ChangeQuizState());
 }
}
