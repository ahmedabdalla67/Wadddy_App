import 'package:first_app/layout/news_app/cubit/news_cubit.dart';
import 'package:first_app/layout/news_app/cubit/news_states.dart';
import 'package:first_app/modules/news_app/search/search_screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/cubit/app_cubit.dart';
import 'package:first_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
                'News App'
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(
                      Icons.search,
                    size: 30.0,
                  ),
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(
                    Icons.brightness_6_outlined,
                    size: 30.0,
                  ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
