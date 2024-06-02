import 'package:carpooling/constants/config.dart';
import 'package:carpooling/constants/fonts.dart';
import 'package:carpooling/constants/get_stores.dart';
import 'package:carpooling/constants/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  // String env = Config.useConfigDotenvFile(Config.APP_PACKAGE_NAME);
  // await dotenv.load(fileName: env);

  // init Hive
  // final document = await getApplicationDocumentsDirectory();
  // Logger().d('App document dir: ${document.path}');
  await GetStorage.init();
  runApp(const ChnqooCarpoolingMobile());
}

outPrintln() {
  print("Build command line params: ");
  print("--> " + Config.APP_PACKAGE_NAME);
  print("--> " + Config.APP_NAME);
  print("--> " + dotenv.get("ENV"));
}

class ChnqooCarpoolingMobile extends StatefulWidget {
  const ChnqooCarpoolingMobile({super.key});

  @override
  State<ChnqooCarpoolingMobile> createState() => ChnqooWalletMobileState();
}

class ChnqooWalletMobileState extends State<ChnqooCarpoolingMobile> {
  // This widget is the root of your application.
  final GlobalKey<NavigatorState> appContext = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640));

    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        fontFamily: Fonts.HarmonyOS,
        // scaffoldBackgroundColor: CupertinoColors.systemBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CupertinoColors.systemBrown,
          surface: CupertinoColors.systemBackground,
        ),
        useMaterial3: true,
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // 设置圆角半径为10
          ),
        ),
      ),
      routingCallback: (route) {
        print('Current route: ${route!.current}');
      },
      locale: Locale('zh'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh'),
        const Locale('en'),
      ],
      builder: EasyLoading.init(builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: widget!,
        );
      }),
      initialRoute: RoutesClass.HOME,
      getPages: RoutesClass.routes,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 360),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var stores = Get.put(GetStores());
    // ever(stores.user, (value) {});
    // Get.updateLocale(Locale('zh', 'CN'));
  }

  @override
  void didUpdateWidget(covariant ChnqooCarpoolingMobile oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
}
