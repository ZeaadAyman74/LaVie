import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/layout/layout_screen.dart';
import 'package:orange/modules/profile/cubit/profile_cubit.dart';
import 'package:orange/modules/profile/cubit/states.dart';
import 'package:orange/modules/update_user/update_email.dart';
import 'package:orange/modules/update_user/update_name.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/home_login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            body: ConditionalBuilder(
              condition: (state is GetUserDataSuccessState),
              builder: (context) => Stack(
                children: [
                  Container(
                    color: Colors.black,
                    height: double.infinity,
                    child: Image.asset('assets/images/cover1.svg', opacity: const AlwaysStoppedAnimation(.5),
                      fit: BoxFit.cover,
                    )
                  ),
                  Positioned(
                      right: 10,
                      top: 30,
                      child: IconButton(
                          onPressed: () {
                            print('zeaad');
                          },
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 30,
                          ))),
                  Positioned(
                      left: 10,
                      top: 30,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LayoutScreen()), (route) => false);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ))),
                   const Positioned(
                    left: 120,
                    right: 120,
                    top: 80,
                    bottom: 500,
                    child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('assets/images/profile.svg')),
                  ),
                  Positioned(
                    top: 260,
                    right: 90,
                    left: 110,
                    child: Text(
                      '${cubit.userModel!.data!.firstName} ${cubit.userModel!.data!.lastName}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Positioned(
                    top: 310,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Color(0xffF3FEF1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/points.svg'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'You have 30 points',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Edit Profile ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateNameScreen()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15))),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/change_name.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Change Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 18),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: SvgPicture.asset(
                                            'assets/icons/forward.svg'),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateNameScreen()));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateEmailScreen()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      shape: BoxShape.rectangle),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/change_name.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Change Email',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 18),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: SvgPicture.asset(
                                            'assets/icons/forward.svg'),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateEmailScreen()));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  CacheHelper.removeValue(key: 'token').then((value) {
                                    if (value) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const HomeLogin()));
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                      shape: BoxShape.rectangle),
                                  child: Row(
                                    children: [
                                     const Icon(Icons.login_outlined),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Logout',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 18),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: SvgPicture.asset(
                                            'assets/icons/forward.svg'),
                                        onPressed: () {
                                          CacheHelper.removeValue(key: 'token').then((value) {
                                            if (value) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => const HomeLogin()));
                                            }
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}


