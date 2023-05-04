import 'package:first_app/layout/waddy_app/cubit/cubit.dart';
import 'package:first_app/layout/waddy_app/cubit/ststes.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_login/waddy_login_screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Waddylayout extends StatelessWidget {
  const Waddylayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShippingCubit.get(context);
    return BlocConsumer<ShippingCubit, ShippingStates>(
        listener: (context, state){},
      builder: (context, state){
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottom(index);
              },
            ),
          );
      },
    );
  }
}
