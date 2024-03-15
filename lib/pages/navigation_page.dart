import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/bloc/navigation_bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/pages/login_page.dart';
import 'package:cv_maker_app/pages/profile_page.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: milkChocolateColor,
              leading: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignedOutState){
                    context.showSuccessSnackBar(context, state.msg);
                    context.push(context, LoginPage(), false);
                  }else if (state is ErrorState){
                    context.showErrorSnackBar(context, state.msg);
                  }
                },
                child: IconButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(SignoutEvent());
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: brownColor,
                    )),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      context.push(context, ProfilePage(), true);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                      color: brownColor,
                    ))
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              decoration: const BoxDecoration(
                color: milkChocolateColor,
                boxShadow: [
                BoxShadow(
                    color: shadowBlackColor,
                    spreadRadius: 0,
                    blurRadius: 56,
                    offset: Offset(10, 14)),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BottomNavigationBar(
                    currentIndex: locator.currentPageIndex,
                    onTap: (index) {
                      context
                          .read<NavigationBloc>()
                          .add(ChangePageEvent(index: index));
                    },
                    showUnselectedLabels: false,
                    selectedItemColor: whiteColor,
                    unselectedItemColor: whiteColor,
                    backgroundColor: brownColor,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home_filled,
                            color: whiteColor,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: FaIcon(
                            FontAwesomeIcons.peopleGroup,
                            color: whiteColor,
                          ),
                          label: "Community"),
                    ]),
              ),
            ),
            body: locator.pageList[locator.currentPageIndex],
          );
        },
      ),
    );
  }
}
