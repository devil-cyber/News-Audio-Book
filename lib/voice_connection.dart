import 'package:http/http.dart' as http;
import "dart:convert";

var api_key = "API key";

Future<http.Response> voiceResponse(String text) async {
  String url =
      "https://texttospeech.googleapis.com/v1beta1/text:synthesize?key=${api_key}";
  var body = jsonEncode({
    "audioConfig": {"audioEncoding": "LINEAR16", "pitch": 0, "speakingRate": 1},
    "input": {"text": text},
    "voice": {"languageCode": "en-US", "name": "en-US-Wavenet-D"}
  });
  var response = http.post(url,
      headers: {"content-type": "appplication/json"}, body: body);
  return response;
}
