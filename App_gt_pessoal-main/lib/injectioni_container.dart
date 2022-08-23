import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:nota/feature/domain/use_cases/nota_usecase/add_new_note_usecase_imp.dart';
import 'package:nota/feature/domain/use_cases/nota_usecase/delete_note_usecase_imp.dart';
import 'package:nota/feature/domain/use_cases/nota_usecase/update_note_usecase_imp.dart';

import 'feature/data/remote/data_sources/firebase_remote_data_source.dart';
import 'feature/data/remote/data_sources/firebase_remote_data_source_impl.dart';
import 'feature/data/repositories/repository_impl.dart';
import 'feature/domain/repositories/firebase_repository.dart';
import 'feature/domain/use_cases/nota_usecase/add_new_note_usecase.dart';
import 'feature/domain/use_cases/nota_usecase/delete_note_usecase.dart';
import 'feature/domain/use_cases/nota_usecase/get_current_uid_usecase_imp.dart';
import 'feature/domain/use_cases/nota_usecase/get_notes_usecase _imp.dart';
import 'feature/domain/use_cases/user_usecase/get_create_current_user_usecase.dart';
import 'feature/domain/use_cases/nota_usecase/get_current_uid_usecase.dart';
import 'feature/domain/use_cases/nota_usecase/get_notes_usecase.dart';
import 'feature/domain/use_cases/user_usecase/is_sign_in_usecase.dart';
import 'feature/domain/use_cases/user_usecase/sign_in_usecase.dart';
import 'feature/domain/use_cases/user_usecase/sign_out_usecase.dart';
import 'feature/domain/use_cases/user_usecase/sign_up_usecase.dart';
import 'feature/domain/use_cases/nota_usecase/update_note_usecase.dart';
import 'feature/presentation/cubit/auth/auth_cubit.dart';
import 'feature/presentation/cubit/note/note_cubit.dart';
import 'feature/presentation/cubit/user/user_cubit.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
  //Cubit/Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
        getCreateCurrentUserUseCase: sl.call(),
        signInUseCase: sl.call(),
        signUPUseCase: sl.call(),
      ));
  sl.registerFactory<NoteCubit>(() => NoteCubit(
        upDateNoteUseCase: sl.call(),
        getNotesUseCase: sl.call(),
        deleteNoteUseCase: sl.call(),
        addNewNoteUseCase: sl.call(),
      ));

  //useCase
  sl.registerLazySingleton<AddNewNoteUseCase>(
      () => AddNewNoteUseCaseImp(notarepository: sl.call()));
  sl.registerLazySingleton<DeleteNoteUseCase>(
      () => DeleteNoteUseCaseImp(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUsecase>(
      () => GetCreateCurrentUserUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCaseImp(repository: sl.call()));
  sl.registerLazySingleton<GetNotesUseCase>(
      () => GetNotesUseCaseImp(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUPUseCase>(
      () => SignUPUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateNoteUseCase>(
      () => UpdateNoteUseCaseImp(repository: sl.call()));

  //repository
  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
