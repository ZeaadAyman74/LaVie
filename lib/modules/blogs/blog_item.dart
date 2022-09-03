import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  var model;

  BlogItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
     // width: 180,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              model.imageUrl != ""
                                  ? 'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}'
                                  : 'https://th.bing.com/th/id/OIP.rPDuoJgIPkGu-9TSDDLfjgHaHa?pid=ImgDet&w=600&h=600&rs=1',
                          ),
                          fit: BoxFit.cover),
                    ),
                    height: 160,
                    width: 140,
                  ),
                ),
              ),
              if (model.imageUrl != "")
                const SizedBox(
                  width: 10,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.name}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: Text(
                          '${model.description}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,

                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
