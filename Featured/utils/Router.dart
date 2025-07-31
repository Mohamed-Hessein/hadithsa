import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/Bookdetailsbody.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/Bookpagebody.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/Bookspage.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/Home_view.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/bookdetails.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/loginview.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/setting.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/Fetchapicubit.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/fetchapistate.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/hadith.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/repo/homerepo.dart';
import 'package:wazker/Featured/Persintion/Home/views/splash/Splash.dart';
import 'package:wazker/Featured/Home/persintion/views/screens/CreateAcountpage.dart';
import 'package:dio/dio.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/api.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/repo/homeeimplment.dart';

class Router2 {
  static final String kHomeview = '/Homeview';
  static final String KCreateacountpage = '/create';
  static final String Klogin = '/login';

  static final KBookPage = '/Bookpage';
  static final KBookcatgorydetails = '/Bookcatogrydetails';
  static final KsearchIcon = '/SearchIcon';
  static final KgoAftersignup = '/Goafter';
  static final Ksetting = '/setting';
  static User? user = FirebaseAuth.instance.currentUser;
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => Splash()),
      GoRoute(path: kHomeview, builder: (context, state) => HomeView()),
      GoRoute(
        path: KCreateacountpage,
        builder: (context, state) => Createacountpage(),
      ),
      GoRoute(
        path: Klogin,
        builder: (context, state) => user != null ? Bookspage() : Loginview(),
      ),
      // GoRoute(path: Kforgot, builder: (context, state) => Forgotpassword()),

      // GoRoute(
      //   path: Knewpassword,
      //   builder: (context, state) => Createnewpassword(),
      // ),
      GoRoute(path: KBookPage, builder: (context, state) => Bookspage()),

      GoRoute(path: KgoAftersignup, builder: (context, state) => Loginview()),
      GoRoute(path: Ksetting, builder: (context, state) => Setting()),
      GoRoute(
        path: KBookcatgorydetails,
        builder: (context, state) {
          return Bookdetails();
        },
      ),
    ],
  );
}
