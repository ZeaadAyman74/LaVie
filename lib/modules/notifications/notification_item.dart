import 'package:flutter/material.dart';
import 'package:orange/models/notifications.dart';

class NotificationItem extends StatelessWidget {
  NotificationsModel? model;

  NotificationItem(this.model,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  model!.image!,
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
                      model!.title!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 15,),
                    if(model!.body!=null)
                    Text(
                     model!.body!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          ),

                    if(model!.body!=null)
                      const SizedBox(height: 20,),
                      Text(
                      model!.date!,
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


        ],
      ),
    );
  }
}
