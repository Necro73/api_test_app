import 'package:api_test_app/data/api/http_helper.dart';
import 'package:api_test_app/data/models/main/item.dart';

abstract class MainApi {
  static Future<Object?> testItems() async {
    var res = await HttpHelper.get('/testItems');
    return res;
  }

  static Future<Object?> testItemPost({required Item request}) async {
    var res = await HttpHelper.post('/testItem', request: request.toJson());
    return res;
  }

  static Future<Object?> testItemPut({required Item request}) async {
    var res = await HttpHelper.put('/testItem', request: request.toJson());
    return res;
  }

  static Future<Object?> testItemDelete({required Item request}) async {
    var res = await HttpHelper.delete('/testItem', request: request.toJson());
    return res;
  }
}