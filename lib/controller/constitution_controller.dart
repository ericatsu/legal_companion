import 'dart:convert';

import 'package:get/state_manager.dart';

import '../model/constitution_model.dart';
import '../services/service.dart';

class ConstitutionController extends GetxController {
  var isLoading = false.obs;
  RxList constitutionList = <Constitution>[].obs;
  RxList chapterList = <Chapter>[].obs;
  RxList sectionList = <Section>[].obs;

//Causes the objects to appear on debugging
  @override
  void onInit() {
    getConstitutions("");
    super.onInit();
  }


  void getConstitutions(String search) async {
    try {
      isLoading(true);

      dynamic response = await HttpService.getConstitutions(search);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<Constitution> constitutions = body
            .map(
              (dynamic item) => Constitution.fromJson(item),
            )
            .toList();

        constitutionList(constitutions);

        isLoading(false);
      }
    } catch (err) {
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  Future getChapters(String constitutionId) async {
    try {
      isLoading(true);

      dynamic response = await HttpService.getChapters(constitutionId);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<Chapter> chapters = body
            .map(
              (dynamic item) => Chapter.fromJson(item),
            )
            .toList();

        chapterList(chapters);

        isLoading(false);
      }
    } catch (err) {
      // print(err);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  Future getSections(String constitutionId, String chapterId) async {
    try {
      isLoading(true);
      dynamic response =
          await HttpService.getSections(constitutionId, chapterId);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<Section> sections = body
            .map(
              (dynamic item) => Section.fromJson(item),
            )
            .toList();

        sectionList(sections);

        // print(sectionList);

        isLoading(false);
      }
    } catch (err) {
      // print("errorr hhhherrrrrrrhhhh");
      // print(err);
      isLoading(false);
    }
    finally {
      isLoading(false);
    }
  }
}
