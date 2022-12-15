import 'package:http/http.dart';
import 'package:string_templates/string_templates.dart' as templates;

class HttpService {
  static String constitutionsUrl =
      "https://legal-companion-backend.onrender.com/api/v2/constitutions/";
  static String chaptersUrl =
      "https://legal-companion-backend.onrender.com/api/v2/constitutions/{constitutionId}/chapters";
  static String sectionsUrl =
      "https://legal-companion-backend.onrender.com/api/v2/constitutions/{constitutionId}/chapters/{chapterId}/sections";

 static Future getConstitutions(String search) async {
    var params = <String, Object>{'search': search};
    
    return await get(Uri.parse(templates.interpolate(constitutionsUrl, params)));
  }

 static Future getChapters(
      String constitutionId) async {
    var params = <String, Object>{
      'constitutionId': constitutionId,
    };

    return await get(Uri.parse(templates.interpolate(chaptersUrl, params)));

  }

  
 static Future getSections(
      String constitutionId, String chapterId) async {
    var params = <String, Object>{

      'constitutionId': constitutionId,
      'chapterId': chapterId
    };
    return await get(Uri.parse(templates.interpolate(sectionsUrl, params)));
 
  }
}
