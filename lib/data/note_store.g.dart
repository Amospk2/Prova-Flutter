// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStore, Store {
  late final _$editingItemAtom =
      Atom(name: '_NotesStore.editingItem', context: context);

  @override
  String? get editingItem {
    _$editingItemAtom.reportRead();
    return super.editingItem;
  }

  @override
  set editingItem(String? value) {
    _$editingItemAtom.reportWrite(value, super.editingItem, () {
      super.editingItem = value;
    });
  }

  late final _$notesAtom = Atom(name: '_NotesStore.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$_NotesStoreActionController =
      ActionController(name: '_NotesStore', context: context);

  @override
  dynamic setList(List<Note> lNotes) {
    final _$actionInfo =
        _$_NotesStoreActionController.startAction(name: '_NotesStore.setList');
    try {
      return super.setList(lNotes);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem(Note note) {
    final _$actionInfo =
        _$_NotesStoreActionController.startAction(name: '_NotesStore.addItem');
    try {
      return super.addItem(note);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(int index) {
    final _$actionInfo = _$_NotesStoreActionController.startAction(
        name: '_NotesStore.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateItem(int index, String title) {
    final _$actionInfo = _$_NotesStoreActionController.startAction(
        name: '_NotesStore.updateItem');
    try {
      return super.updateItem(index, title);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editingItem: ${editingItem},
notes: ${notes}
    ''';
  }
}
