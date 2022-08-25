import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/modules/home/carts/carts_screen.dart';
import 'package:orange/modules/home/plants/plants.dart';
import 'package:orange/modules/home/products/all_categories.dart';
import 'package:orange/modules/home/seeds/seeds_screen.dart';
import 'package:orange/modules/home/tools/tools_screen.dart';
import 'package:orange/modules/posts/cubit/posts_cubit.dart';
import 'package:orange/modules/posts/posts_screen.dart';
import 'package:orange/modules/quiz/quiz_screen.dart';
import 'package:orange/modules/search/search_screen.dart';
import 'package:orange/shared/cubit/cubit.dart';
import 'package:orange/shared/network/local/cache_helper.dart';
import 'package:orange/shared/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: defaultColor,
                ),
                onPressed: () async{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen()));
                  if(PostsCubit.get(context).posts.isEmpty){
                  }
                },
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/login_logo.svg',
                      fit: BoxFit.fill,
                    )),
              ),
              if( CacheHelper.getData(key: 'validQuiz')!=false)
              CircleAvatar(
                backgroundColor: defaultColor,
                  child: IconButton(
                      onPressed: () {
                        final firstDate = DateTime.now();
                        CacheHelper.putData(key: 'firstDate', value: firstDate.toString()).then((value){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> QuizScreen()));
                          CacheHelper.putData(key: 'validQuiz', value: false);
                        });
                      }, icon: const Icon(Icons.question_mark,color: Colors.white,))),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  },
                  controller: searchController,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xffF8F8F8),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'assets/icons/Search.svg',
                        ),
                      ),
                      hintText: "Search",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 16)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (AppCubit.get(context).carts.isEmpty) {
                      AppCubit.get(context).getCarts();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartsScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    primary: defaultColor,
                  ),
                  child: SvgPicture.asset('assets/icons/Cart.svg'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: double.maxFinite,
          //height: 40,
          child: TabBar(
              //splashBorderRadius: const BorderRadius.all(Radius.circular(15)),

              onTap: (index) {
                switch (index) {
                  case 1:
                    {
                      if (AppCubit.get(context).plantsModel == null) {
                        AppCubit.get(context).getPlants();
                      }
                      break;
                    }
                  case 2:
                    {
                      if (AppCubit.get(context).seedsModel == null) {
                        AppCubit.get(context).getSeeds();
                      }
                      break;
                    }
                  case 3:
                    {
                      if (AppCubit.get(context).plantsModel == null) {
                        AppCubit.get(context).getTools();
                      }
                      break;
                    }
                }
              },
              controller: _tabController,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: defaultColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              indicatorColor: defaultColor,
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: 'Plants',
                ),
                Tab(
                  text: 'Seeds',
                ),
                Tab(
                  text: 'Tools',
                )
              ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ProductsScreen(),
              PlantsScreen(),
              SeedsScreen(),
              ToolsScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
