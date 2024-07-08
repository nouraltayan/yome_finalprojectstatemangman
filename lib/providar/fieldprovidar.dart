import 'package:flutter/cupertino.dart';

List<TextEditingController> controlle = [TextEditingController()];
late List<String> copy;

class FieldProvider extends ChangeNotifier {
  List<TextEditingController> controllers = [TextEditingController()];

  void addTextField() {
    controllers.add(TextEditingController());
    notifyListeners();
  }

  void removeTextField(int index) {
    controllers.removeAt(index);
    notifyListeners();
  }

  List<String> getTextFieldsContent() {
    copy = controllers.map((controller) => controller.text).toList();
    controllers = controlle;
    notifyListeners();
    return copy;
  }
}
