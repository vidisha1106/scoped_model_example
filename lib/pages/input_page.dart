import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/model/user_model.dart';

class InputPage extends StatelessWidget {
  InputPage({super.key});

  final textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.black, width: 1))),
            ),
            SizedBox(
              height: 50,
            ),
            ScopedModelDescendant<UserModel>(
              builder: ( context, child, model) {
                return ElevatedButton(
                  onPressed: () {
                    debugPrint(textController.text);
                    model.changeName(textController.text);
                    debugPrint(model.name);
                    textController.clear();
                  },
                  style: ButtonStyle(
                      side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1))),
                  child: Text("Change Name",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                );

              },
            )
          ],
        ),
      ),
    );
  }
}
