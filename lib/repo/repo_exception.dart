import 'dart:async';
import 'dart:io';

// import 'package:appwrite/appwrite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helpers/logger.dart';
// import 'package:shopping_admin/helpers/logger.dart';

class RepositoryException implements Exception {
  final String message;
  final Exception? exception;
  final StackTrace? stackTrace;

  RepositoryException({required this.message, this.exception, this.stackTrace});

  @override
  String toString() {
    return "RepositoryExcept :$message";
  }
}

mixin RepositoryExceptionMixin {
  Future<T> exceptionHandler<T>(Future computation,
      {String unKnownMessage = "Exception"}) async {
    try {
      return await computation;
    } on FirebaseAuthException catch (e) {
      logger.e(e);

      Fluttertoast.showToast(msg: e.message ?? "An Firebase Auth error");
      throw RepositoryException(
        message: e.message ?? "An Firebase Auth error",
      );
    } on FirebaseException catch (e) {
      logger.e(e);

      Fluttertoast.showToast(msg: e.message ?? "An Firebase Auth error");

      throw RepositoryException(
        message: e.message ?? "An Firebase  error",
      );
    } on IOException catch (e, st) {
      logger.e(e);
      Fluttertoast.showToast(msg: e.toString());

      throw RepositoryException(
          message: unKnownMessage, exception: e, stackTrace: st);
    } on Exception catch (e, st) {
      logger.e(e, [st]);
      Fluttertoast.showToast(msg: e.toString());

      throw RepositoryException(
          message: unKnownMessage, exception: e, stackTrace: st);
    }
  }
}
