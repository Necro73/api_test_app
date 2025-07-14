import 'dart:convert';

import 'package:api_test_app/data/api/main_api.dart';
import 'package:api_test_app/data/models/main/item.dart';

class MainRepository {
  Future<List<Item>> testItems() async {
    var res = await MainApi.testItems();
    List<Item> response = [];
    if (res is List<Object?>) {
      for (var resItem in res) {
        response.add(Item.fromJson(json.decode(resItem as String) as Map<String, dynamic>));
      }
    }
    return response;
  }

  Future<Item> testItemPost({required Item request}) async {
    var res = await MainApi.testItemPost(request: request);
    Item response = Item.fromJson(res as Map<String, dynamic>);
    return response;
  }

  Future<Item> testItemPut({required Item request}) async {
    var res = await MainApi.testItemPut(request: request);
    Item response = Item.fromJson(res as Map<String, dynamic>);
    return response;
  }

  Future<Item> testItemDelete({required Item request}) async {
    var res = await MainApi.testItemDelete(request: request);
    Item response = Item.fromJson(res as Map<String, dynamic>);
    return response;
  }
}
