import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../domain/use_cases/nota_usecase/add_new_note_usecase.dart';
import '../../../domain/use_cases/nota_usecase/delete_note_usecase.dart';
import '../../../domain/use_cases/nota_usecase/get_notes_usecase.dart';
import '../../../domain/use_cases/nota_usecase/update_note_usecase.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final UpdateNoteUseCase upDateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final AddNewNoteUseCase addNewNoteUseCase;
  NoteCubit(
      {required this.getNotesUseCase,
      required this.deleteNoteUseCase,
      required this.addNewNoteUseCase,
      required this.upDateNoteUseCase})
      : super(NoteInitial());

  Future<void> addNote({required NoteEntity note}) async {
    try {
      await addNewNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> deleteNote({required NoteEntity note}) async {
    try {
      await deleteNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> updateNote({required NoteEntity note}) async {
    try {
      await upDateNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> getNotes({required String uid}) async {
    emit(NoteLoading());
    try {
      getNotesUseCase.call(uid).listen((notes) {
        emit(NoteLoaded(notes: notes));
      });
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }
}
