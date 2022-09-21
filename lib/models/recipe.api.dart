import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_list/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '24', "start": '0', "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "c104656e2emsh5afffa9b5a1199bp11715fjsnadcd270b72aa",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = []; //temporary list
    // loop through data feed &data is in array form
    for (var i in data['feed']) {
      _temp.add(i['content']['details']); // here i is a variable
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
