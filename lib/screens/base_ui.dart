// import 'package:hidden/screens/change_password_ui.dart';
// import 'package:hidden/screens/favourites_ui.dart';
import 'package:hidden_gems_sg/screens/home_ui.dart';
import 'package:hidden_gems_sg/screens/favourites_ui.dart';
import 'package:hidden_gems_sg/screens/inbox_ui.dart';
// import 'package:hidden/screens/interests_ui.dart';
import 'package:hidden_gems_sg/screens/search_ui.dart';
import 'package:hidden_gems_sg/screens/place_ui.dart';
import 'package:hidden_gems_sg/screens/profile_ui.dart';
import 'package:hidden_gems_sg/screens/tracker_ui.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

class BaseScreen extends StatefulWidget {
  static const routeName = '/base';

  @override
  State<StatefulWidget> createState() {
    return _BaseScreen();
  }
}

class _BaseScreen extends State<BaseScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      FavouriteScreen(),
      TrackerScreen(),
      InboxScreen(),
      ProfileScreen(),
    ];
    // ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        activeColorPrimary: Color(0xFF6488E5),
        inactiveColorPrimary: Color(0xffd1d1d6),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/home',
            // ignore: body_might_complete_normally_nullable
            onGenerateRoute: (RouteSettings? settings) {
              switch (settings!.name) {
                case PlaceScreen.routeName:
                  {
                    final PlaceScreenArguments args =
                        settings.arguments as PlaceScreenArguments;
                    return MaterialPageRoute(builder: (context) {
                      return PlaceScreen(args.place, args.favourites);
                    });
                    // ignore: dead_code
                    break;
                  }
                case SearchScreen.routeName:
                  {
                    final SearchScreenArguments args =
                        settings.arguments as SearchScreenArguments;
                    return MaterialPageRoute(builder: (context) {
                      return SearchScreen(
                          args.max, args.min, args.sort, args.text);
                    });
                  }
              }
            }
            //return null;
            ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        activeColorPrimary: Color(0xFF6488E5),
        inactiveColorPrimary: Color(0xffd1d1d6),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/favourites',
          onGenerateRoute: (RouteSettings? settings) {
            // switch (settings!.name) {
            //   case PlaceScreen.routeName:
            //     {
            //       final PlaceScreenArguments args =
            //       settings.arguments as PlaceScreenArguments;
            //       return MaterialPageRoute(builder: (context) {
            //         return PlaceScreen(args.place, args.favourites);
            //       });
            //       // ignore: dead_code
            //       break;
            //     }
            // }
            return null;
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list_alt_outlined),
        activeColorPrimary: Color(0xFF6488E5),
        inactiveColorPrimary: Color(0xffd1d1d6),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/tracker',
          onGenerateRoute: (RouteSettings? settings) {
            // switch (settings!.name) {
            //   case PlaceScreen.routeName:
            //     {
            //       final PlaceScreenArguments args =
            //           settings.arguments as PlaceScreenArguments;
            //       return MaterialPageRoute(builder: (context) {
            //         return PlaceScreen(args.place, args.favourites);
            //       });
            //       // ignore: dead_code
            //       break;
            //     }
            // }
            return null;
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.markunread_mailbox_outlined),
        activeColorPrimary: Color(0xFF6488E5),
        inactiveColorPrimary: Color(0xffd1d1d6),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/inbox',
          onGenerateRoute: (RouteSettings? settings) {
            switch (settings!.name) {
              case PlaceScreen.routeName:
                {
                  final PlaceScreenArguments args =
                      settings.arguments as PlaceScreenArguments;
                  return MaterialPageRoute(builder: (context) {
                    return PlaceScreen(args.place, args.favourites);
                  });
                  // ignore: dead_code
                  break;
                }
            }
            return null;
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_sharp),
        activeColorPrimary: Color(0xFF6488E5),
        inactiveColorPrimary: Color(0xffd1d1d6),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/profile',
          onGenerateRoute: (RouteSettings? settings) {
            // switch (settings!.name) {
            //   case ChangePasswordScreen.routeName:
            //     {
            //       final ChangePasswordArguments args =
            //           settings.arguments as ChangePasswordArguments;
            //       return MaterialPageRoute(builder: (context) {
            //         return ChangePasswordScreen(args.email);
            //       });
            //       // ignore: dead_code
            //       break;
            //     }
            //   case InterestScreen.routeName:
            //     {
            //       final InterestScreenArguments args =
            //           settings.arguments as InterestScreenArguments;
            //
            //       return MaterialPageRoute(builder: (context) {
            //         return InterestScreen(args.userID, args.userInts);
            //       });
            //       // ignore: dead_code
            //       break;
            //     }
            // }
            return null;
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
