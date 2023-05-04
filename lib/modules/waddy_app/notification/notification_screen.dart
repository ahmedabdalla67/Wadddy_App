import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => notify(context),
          separatorBuilder: (context, index) => SizedBox(height: 10.0,),
          itemCount: 10,
      ),
    );
  }
}
