import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/modules/profile/cubit/profile_cubit.dart';
import 'package:orange/modules/profile/cubit/states.dart';
import 'package:orange/modules/update_user/update_email.dart';
import 'package:orange/modules/update_user/update_name.dart';

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
                    child: Image.network(
                        fit: BoxFit.cover,
                        opacity: const AlwaysStoppedAnimation(.6),
                        'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/274880215_2117840785046945_8522829344125607352_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_ohc=WNzAvG5jIT0AX-ssqYA&_nc_ht=scontent.fcai20-1.fna&oh=00_AT9LA9N9ulz8ulmpJBlefG0XgaEbf9SG7g5fX6KnGwgfOw&oe=6305E3EE'),
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
                            Navigator.pop(context);
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
                        backgroundImage: NetworkImage(
                            'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/299810747_2250494521781570_4915005802029807842_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=KjKYy-ylajQAX_3aake&_nc_oc=AQlN_OZ2JHxvsyFXwYt4y4CZ-_rpbxZZmova_ZjMqEDhnUAgnTQFKAZwV6ka_P7uWek&_nc_ht=scontent.fcai20-1.fna&oh=00_AT-yAZTDCVhyOPQ498O6xoCnVv24if3HuoSwt9ltLxtt-g&oe=63067E3A')),
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
