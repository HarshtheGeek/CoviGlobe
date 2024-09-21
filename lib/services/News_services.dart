import 'package:http/http.dart' as http;

class NewsApi{
  Future<void> getNews() async{
    Uri url = Uri.parse("https://gnews.io/api/v4/top-headlines?country=in&category=health&apikey=7b13d79e21a51c2a3d22c4872f0b3dbb");
    var response = await http.get(url);


  }
}