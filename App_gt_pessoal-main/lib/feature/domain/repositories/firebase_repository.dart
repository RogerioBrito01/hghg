import '../entities/note_entity.dart';
import '../entities/user_entity.dart';

abstract class Repository {
  //user
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> getCreateCurrentUser(UserEntity user);
  //nota
  Future<void> addNewNote(NoteEntity note);
  Future<void> updateNote(NoteEntity note);
  Future<void> deleteNote(NoteEntity note);
  Stream<List<NoteEntity>> getNotes(String uid);
  Future<String> getCurrentUId();
}
