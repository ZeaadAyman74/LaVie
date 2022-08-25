import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/shared/styles/colors.dart';

class PostItem extends StatelessWidget {
var model;
   PostItem(this.model,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                '${model!.user!.imageUrl!}'
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${model.user.firstName} ${model.user.lastName}",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    'a month ago',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(height: 1),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${model!.title}',
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              fontWeight: FontWeight.w700, color: defaultColor,fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${model.description}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: const Color(0xff8F8D8D)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  //  if(model.postImage!=null)
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child:  Image.network(
                      'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}',
                      fit:BoxFit.cover ,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/like.svg',
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '${model.forumLikes.length} Likes',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  width: 25,
                ),
                 Text('${model.forumComments.length} Replies'),
              ],
            ),
          ],
        );


  }
}

