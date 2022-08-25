import 'package:flutter/material.dart';
import 'package:orange/modules/notifications/notification_item.dart';
import 'package:orange/modules/notifications/notifications_data.dart';
import 'package:orange/shared/components/components.dart';

import '../../shared/styles/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Notification', style: Theme.of(context).textTheme.subtitle1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>NotificationItem(notifications[index]),
                separatorBuilder:(context,index) =>const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Divider(height: 1,thickness: 1),
                ),
                itemCount: notifications.length),
          ],
        ),
      ),
    );
  }
}
