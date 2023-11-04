import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login/data/note.dart';
import 'package:login/data/note_store.dart';
import 'package:login/ui/features/utils/alert_dialog.dart';
import 'package:login/ui/features/utils/privacy_pollicy.dart';
import 'package:login/ui/features/utils/text_form_field_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final noteStore = NotesStore();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode focus = FocusNode();
  late final SharedPreferences? prefs;
  final TextEditingController controller = TextEditingController();

  HomePage({super.key});

  Future<void> updateSetPrefes() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setStringList(
        'notesList', noteStore.notes.map((value) => value.title).toList());
  }

  @override
  Widget build(BuildContext context) {
    focus.requestFocus();

    focus.addListener(() {
      if (!focus.hasFocus) {
        focus.requestFocus(); 
        focus.consumeKeyboardToken(); 
      }
    });
    final args = ModalRoute.of(context)!.settings.arguments as List<String>?;
    if (args != null) {
      noteStore.setList(args.map((title) => Note(title: title)).toList());
    }
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff1C3D5F), Color(0xff32928B)],
            begin: Alignment.topCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Observer(
                  builder: (_) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: noteStore.notes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Text(
                                noteStore.notes[index].title.length > 20
                                    ? '${noteStore.notes[index].title.substring(0, 20)}...'
                                    : noteStore.notes[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 16),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  focus.requestFocus();
                                  controller.text =
                                      noteStore.notes[index].title;
                                  noteStore.editingItem =
                                      noteStore.notes[index].title;
                                },
                                icon: const Icon(
                                  Icons.mode_edit,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (await showMyDialog(context)) {
                                    updateSetPrefes();
                                    noteStore.removeItem(index);
                                    focus.requestFocus();
                                  }
                                },
                                icon: const Icon(Icons.delete_forever_rounded,
                                    size: 30),
                              )
                            ],
                          ),
                          Container(
                            height: 1,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextForm(
                  hintText: 'Digite Seu Texto',
                  focus: focus,
                  controller: controller,
                  onFieldSubmitted: (value) async {
                    if (formKey.currentState!.validate()) {
                      if (noteStore.editingItem != null) {
                        var item = noteStore.notes.indexWhere((element) =>
                            element.title == noteStore.editingItem);
                        noteStore.updateItem(item, controller.text);
                        noteStore.editingItem = null;
                      } else {
                        noteStore.addItem(Note(title: value));
                      }
                      updateSetPrefes();
                      formKey.currentState!.reset();
                      focus.requestFocus();
                      controller.text = '';
                    }
                  },
                ),
              ),
              const Spacer(),
              const PrivacyPollicy()
            ],
          ),
        ),
      ),
    );
  }
}
