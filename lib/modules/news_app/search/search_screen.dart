import 'package:first_app/layout/news_app/cubit/news_cubit.dart';
import 'package:first_app/layout/news_app/cubit/news_states.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextForm(
                    controller: searchController,
                    type: TextInputType.text,
                    text: 'Search',
                    prefix: Icons.search,
                    valid: (String? value) {
                      if(value!.isEmpty)
                      {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    onChange: (String value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    }
                ),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );
  }
}
