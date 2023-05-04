// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.redAccent,
  required VoidCallback function,
  required BorderRadius radius,
  bool isUpper = true,
  required String text,
}) => Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextForm({
    required TextEditingController controller,
    required TextInputType type,
    required String text,
    IconData? prefix,
    String? Function(String?)? valid,
    Function()? onTap,
    ValueChanged<String>? onChange,
    bool isSecure = false,
    IconData? suffix,
    Function? suffixAction,
}) => TextFormField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: text,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null ? IconButton(
        onPressed: (){
          suffixAction!();
        },
          icon: Icon(suffix)) : null,
    ),
    onTap: onTap,
    onChanged: onChange,
    validator: valid,
    obscureText: isSecure,
  );

Widget buildTaskItem(Map model, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(
          '${model['time']}',
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${model['title']}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${model['date']}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      IconButton(
          onPressed: ()
          {
            AppCubit.get(context).updateData(
                status: 'done',
                id: model['id']
            );
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          )
      ),
      SizedBox(
        width: 10.0,
      ),
      IconButton(
          onPressed: ()
          {
            AppCubit.get(context).updateData(
                status: 'archive',
                id: model['id']
            );
          },
          icon: Icon(
            Icons.archive,
            color: Colors.black26,
          )
      ),
    ],
  ),
);

Widget buildArticleItem(article , context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${article['urlToImage']}',
              )
          ),
        ),
      ),
      const SizedBox(width: 20.0,),
      Expanded(
        child: Container(
          height: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Container(
    width: double.infinity,
    height: 0.5,
    color: Colors.grey,
  ),
);

Widget articleBuilder(list, context) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) =>
      ListView.separated(
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
      ),
  fallback: (context) =>
  const Center(child: CircularProgressIndicator()),
);

void navigateTo(context, widget)
{
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
  );
}

void navigateToAndFinish(context, widget) =>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (route) => false);

Widget notify(context) => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Column(
    children: [
      Card(
        margin: EdgeInsets.all(7.0),
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.payment,color: Colors.redAccent, size: 30.0,),
                SizedBox(width: 7.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment successful',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('You have made shipping Payment ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10.0,),
      Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.all(7.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.local_offer,color: Colors.redAccent, size: 30.0,),
                SizedBox(width: 7.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Today’s Special Offers !',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text('You get a special promo today!',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10.0,),
      Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.all(7.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.new_label,color: Colors.redAccent, size: 30.0,),
              SizedBox(width: 7.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Services Available !',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text('Now you can search the nearby drop',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  ),
);