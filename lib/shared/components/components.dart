// ignore_for_file: unnecessary_const, prefer_const_constructors, unnecessary_brace_in_string_interps, unused_import

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udemy/shared/components/constants.dart';
import 'package:flutter_udemy/shared/cubit/cubit.dart';

Widget defaultButton({
  Color color = const Color.fromARGB(234, 76, 5, 117),
  double width = double.infinity,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double radius = 0.0,
}) =>
    Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          '${isUpperCase ? text.toUpperCase() : text}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChang,
  VoidCallback? onTape,
  required FormFieldValidator<String> validator,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  required TextInputType type,
  VoidCallback? suffixPres,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit,
      onChanged: onChang,
      validator: validator,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTape,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPres, icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget tasksBuilder(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit().get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables

          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                AppCubit().get(context).updateDatabase(
                      status: 'done',
                      id: model['id'],
                    );
              },
              icon: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit().get(context).updateDatabase(
                      status: 'archive',
                      id: model['id'],
                    );
              },
              icon: Icon(
                Icons.archive,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget buildTask({
  required var tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => tasksBuilder(tasks[index], context),
        separatorBuilder: (context, index) => Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[200],
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.task_alt,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildArticlItem(
  artical,
  context,
) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${artical['urlToImage']}"),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    "${artical['publishedAt']}",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget articalItem(list, context) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticlItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        ),
    fallback: (context) => Center(child: CircularProgressIndicator()));
