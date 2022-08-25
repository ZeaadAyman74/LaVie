import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:orange/shared/cubit/cubit.dart';
import 'package:orange/shared/cubit/states.dart';
import 'package:orange/shared/styles/colors.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder:(context, state) {
        var cubit =AppCubit.get(context);
        int currentPage=cubit.currentPage;
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              height: 70,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: defaultColor,
              color: const Color(0x44E1E1E3),
              index:cubit.currentPage ,
              animationDuration: const Duration(milliseconds: 400),
              onTap: (index){
                cubit.changeNavBar(index,context);
              },
              items:  [
                ImageIcon(const AssetImage('assets/icons/leave.png'),size: 40,color:currentPage==0 ?Colors.white : Colors.black ,),
                ImageIcon(const AssetImage('assets/icons/qr-code.png'),size: 40,color:currentPage==1 ?Colors.white : Colors.black),
                ImageIcon(const AssetImage('assets/icons/home.png'),size: 40,color:currentPage==2 ?Colors.white : Colors.black),
                ImageIcon(const AssetImage('assets/icons/bell.png'),size: 40,color:currentPage==3 ?Colors.white : Colors.black),
                ImageIcon(const AssetImage('assets/icons/profile.png'),size: 40,color:currentPage==4 ?Colors.white : Colors.black),
              ],
            ),
            body:cubit.screens[currentPage],
          ),
        );
      } ,
    );
  }
}
