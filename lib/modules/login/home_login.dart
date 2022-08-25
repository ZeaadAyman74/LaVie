import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/modules/login/signup_screen.dart';
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
                    start: 163, end: 130,bottom: 60),
                child: SizedBox(
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
                  )
                ]),
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
