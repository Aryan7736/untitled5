
import 'package:untitled5/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:untitled5/login/login_view.dart';
import 'package:untitled5/webservice/apiservice.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: LoginView),

  ],
  dependencies: [
    LazySingleton(classType: ApiService),

  ],
)
class AppSetup {}
