import 'package:flutter/material.dart';
import 'package:login/ui/features/utils/privacy_pollicy.dart';
import 'package:login/ui/features/utils/text_form_field_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff1C3D5F), Color(0xff32928B)],
            begin: Alignment.topCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Usuário",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    const TextForm(
                      maxLengthCheck: 20,
                      icon: Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Senha",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    const TextForm(
                      minLengthCheck: 2,
                      maxLengthCheck: 20,
                      charCheck: true,
                      icon: Icon(Icons.lock),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (context.mounted && formKey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (context.mounted) {
                        Navigator.of(context).pushNamed('home', arguments: prefs.getStringList('notesList'));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      fixedSize: const Size.fromWidth(190),
                      backgroundColor: const Color.fromARGB(236, 96, 197, 131)),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const Spacer(),
                const PrivacyPollicy()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
