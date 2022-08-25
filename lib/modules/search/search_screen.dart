import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange/modules/blogs/blog_item.dart';
import 'package:orange/shared/cubit/cubit.dart';
import 'package:orange/shared/styles/colors.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List allData = [];
  List searchList = [];
  List searchHistory = [];
  bool searched = false;
  String searchWord = ' ';
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    if (allData.isEmpty) {
      allData = AppCubit.get(context).allBlogs;
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value) {
                    searched = true;
                    setState(() {
                      searchList = allData
                          .where((product) => product.name.startsWith(value))
                          .toList();
                      itemCount = searchList.length;
                      searchWord = value;
                    });
                  },
                  onFieldSubmitted: (value) {
                    searchHistory.add(value);
                  },
                  controller: searchController,
                  style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
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
              const SizedBox(
                height: 10,
              ),
              if (searched)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text('Results for “ '),
                      Text(
                        searchWord,
                        style: const TextStyle(color: defaultColor),
                      ),
                      const Text(' "'),
                      const Spacer(),
                      Text('$itemCount found',style: const TextStyle(color: defaultColor),),
                    ],
                  ),
                ),
              ConditionalBuilder(
                  condition: searchList.isNotEmpty,
                  builder: (context) => ListView.separated(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => BlogItem(searchList[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: searchList.length),
                  fallback: (context) => searched
                      ? Align(
                    alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/carts_empty.svg'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Not found',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recent History',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder:(context,index)=> Row(
                                      children: [
                                        // SvgPicture.asset('assets/icons/history.svg'),
                                        const Icon(Icons.history_toggle_off_rounded),
                                      const  SizedBox(width: 5,),
                                        searchHistory[index],
                                        const Spacer(),
                                        const Icon(Icons.close_outlined)
                                      ],
                                    ),
                                    separatorBuilder:(context,index)=> const SizedBox(height: 10,),
                                    itemCount: searchHistory.length),
                              ],
                            ),
                          ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}



