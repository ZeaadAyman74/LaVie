import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/modules/posts/cubit/posts_cubit.dart';
import 'package:orange/modules/profile/cubit/profile_cubit.dart';
import 'package:orange/modules/splash_screen/splash_screen.dart';
import 'package:orange/shared/components/constants.dart';
import 'package:orange/shared/cubit/cubit.dart';
import 'package:orange/shared/network/local/cache_helper.dart';
import 'package:orange/shared/network/local/sql_helper.dart';
import 'package:orange/shared/network/remote/dio_helper.dart';
import 'package:orange/shared/styles/themes.dart';
import 'cubit_observer.dart';
import 'layout/layout_screen.dart';
import 'modules/login/home_login.dart';


//flutter.minSdkVersion
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SqlHelper.init('laVie');
  await CacheHelper.init();
  Widget startWidget;
  accessToken=CacheHelper.getData(key: 'token');
  freeSeed=CacheHelper.getData(key: 'freeSeed');
  if(accessToken!=null){
    startWidget= LayoutScreen();
  }else{
    startWidget=const HomeLogin();
  }

  if(CacheHelper.getData(key: 'firstDate')!=null)
    {
      DateTime? firstDate=DateTime.parse(CacheHelper.getData(key: 'firstDate'));
      quizValidation(firstDate);
    }


  BlocOverrides.runZoned(() => runApp( MyApp(startWidget)),
      blocObserver: AppBlocObserver());
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

void quizValidation(DateTime firstDate)async{
  if( daysBetween(firstDate, DateTime.now())%7==0&&daysBetween(firstDate, DateTime.now())!=0){
    await CacheHelper.putData(key: 'validQuiz', value: true);
  }
}

class MyApp extends StatelessWidget {
  Widget startWidget;
   MyApp(this.startWidget,{Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppCubit()..getProducts()..getBlogs(),),
        BlocProvider(create:(context)=>ProfileCubit()..getUserData()),
        BlocProvider(create: (context)=>PostsCubit()..getPosts())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home:SplashScreen(startedScreen: startWidget),
      ),
    );
  }
}

