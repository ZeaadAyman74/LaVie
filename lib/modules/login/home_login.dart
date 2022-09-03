import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/modules/login/signup_screen.dart';
import 'package:orange/modules/profile/cubit/profile_cubit.dart';
import 'cubit/cubit.dart';
import 'login_screen.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({Key? key}) : super(key: key);

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    AppCubit.get(context).toolModel=null;
    AppCubit.get(context).plantsModel=null;
    AppCubit.get(context).productModel=null;
    AppCubit.get(context).seedsModel=null;
    AppCubit.get(context).blogModel=null;
    ProfileCubit.get(context).userModel=null;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset('assets/images/right_flower.svg',height: 100,width: 100,),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 140, end: 130,bottom: 60),
                child: SizedBox(
                  height: 50,width: 200,
                    child: SvgPicture.asset('assets/images/login_logo.svg',fit: BoxFit.fill,)),
              ),
              SizedBox(
                width: double.maxFinite,
                child: TabBar(controller: _tabController, tabs: const [
                  Tab(
                    text: "Sign Up",
                  ),
                  Tab(
                    text: 'Login',
                  ),
                ],
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SignUpScreen(),
                    LoginScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
