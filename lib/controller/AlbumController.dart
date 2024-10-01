import 'package:get/get.dart';

class AlbumController extends GetxController{
  RxList<bool> isListeningList = <bool>[].obs;

  void initializeListeningState(int trackCount) {
    isListeningList = List<bool>.filled(trackCount, false).obs;
  }

  void toggleListening (int index, int trackCount) {
    for (int i = 0; i < trackCount; i++){
      isListeningList[i] = false;
    }
    isListeningList[index] = !isListeningList[index];
  }
}