import 'package:provider/provider.dart';
import 'package:traceebee_admin_app/providers/home-provider/home_provider.dart';

final providers = [
  ChangeNotifierProvider<HomeProvider>(
    create: (context) => HomeProvider(),
    lazy: false,
  ),
];
