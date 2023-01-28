import 'package:traceebee_admin_app/models/hive_model.dart';

extension GroupingBy on List<HiveModel> {
  Map<String, List<HiveModel>> groupingBy(String key) {
    var result = <String, List<HiveModel>>{};
    for (var element in this) {
      result[element.userID!] = (result[element.userID!] ?? [])..add(element);
    }
    return result;
  }
}
