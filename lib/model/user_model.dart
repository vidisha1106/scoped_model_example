import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model
{
  String name='Vidisha Luhar';

  void changeName(String name)
  {
    this.name=name;
    notifyListeners();
  }
}