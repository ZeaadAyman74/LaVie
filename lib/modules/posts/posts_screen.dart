import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/modules/posts/all_posts_screen.dart';
import 'package:orange/modules/posts/create_post.dart';
import 'package:orange/modules/posts/my_posts_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen>with SingleTickerProviderStateMixin {
  var searchController = TextEditingController();

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Discussion Forums',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchItem(onChange: (){},searchController: searchController),
          SizedBox(
            width: double.maxFinite,
            child: TabBar(
                onTap: (index) {},
                controller: _tabController,
                indicator: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                indicatorColor: defaultColor,
                tabs: const [
                  Tab(
                    text: "All Forums",
                  ),
                  Tab(
                    text: 'My forums',
                  ),
                ]),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AllPostsScreen(),
                MyPostsScreen(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>CreatePostScreen()));
        },
        child: const Icon(Icons.add,color: Colors.white,size: 30,),

      ),
    );
  }
}

