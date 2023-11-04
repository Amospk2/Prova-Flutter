import 'package:login/data/note.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';


class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {

  @observable
  String? editingItem;
  

  @observable
  ObservableList<Note> notes =  ObservableList<Note>();

  @action
  setList(List<Note> lNotes) => notes.addAll(lNotes);

  @action 
  addItem(Note note) {
    notes.add(note);
    }

  @action 
  removeItem(int index) => notes.removeAt(index);

  @action 
  updateItem(int index, String title){
    notes.removeAt(index);

    notes.insert(index, Note(title: title));
  }
}



