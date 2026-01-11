import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/repo_exception.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/model/engagement_models.dart';
import 'package:wings_dating_app/src/model/paginated_response.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

part 'profile_repo.g.dart';

@riverpod
ProfileRepo profileRepo(Ref ref) {
  return ProfileRepo(ref);
}

class ProfileRepo with RepositoryExceptionMixin {
  final Ref ref;

  ProfileRepo(this.ref);

  HttpTemplate httpTemplate = HttpTemplate();
  Future<void> createUserDoc(UserModel userModel) async {
    logger.i("createUserDoc userModel");
    try {
      await httpTemplate.post("/users", body: userModel.toJson());
    } catch (e) {
      logger.i("createUserDoc userModel");
      // Handle the error appropriately
      logger.e("Error creating user document: $e");
      rethrow; // or handle it in a way that fits your app's logic

      // TODO
    }
  }

  // Future<void> updateUserDoc(UserModel userModel) async {
  //   final usercollection = userCollection();
  //   await usercollection
  //       .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
  //       .update(userModel.toJson());
  // }

  Future<UserModel> getCurrentUser() async {
    final currentUserId =
        ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    try {
      final Map<String, dynamic> response =
          await httpTemplate.get("/users/$currentUserId");
      if (response.containsKey('data') &&
          response['data'] is Map<String, dynamic>) {
        final Map<String, dynamic> userMap = response['data'];
        final user = UserModel.fromJson(userMap);
        return user;
      } else {
        throw Exception(
            'Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkUserDocExist() async {
    try {
      await getCurrentUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateUserDoc(UserModel userModel) async {
    logger.i("updateUserDoc userModel");
    final payload = userModel.toJson();
    // Normalize enum/string fields for backend expectations
    payload['role'] = userModel.role.value;
    payload['bodyType'] = userModel.bodyType.value;
    payload['relationshipStatus'] = userModel.relationshipStatus.value;
    payload['ethnicity'] = userModel.ethnicity.value;
    payload['lookingFor'] = userModel.lookingFor.value;
    payload['whereToMeet'] = userModel.whereToMeet.value;

    // Convert GeoPointData to GeoJSON structure expected by backend
    final position = userModel.position;
    if (position != null && position.geopoint.length == 2) {
      payload['position'] = {
        'type': position.type,
        'coordinates': position.geopoint,
      };
    }

    logger.i("Payload for updateUserDoc: $payload");
    await httpTemplate.put("/users/${userModel.id}", body: payload);
  }

  // Future<void> updateLocation(dynamic pointData) async {
  //   logger.e(pointData);
  //   final usercollection = userCollection();

  //   await exceptionHandler<void>(
  //     usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).update(
  //       {
  //         "position": pointData,
  //       },
  //     ),
  //   );
  // }

  Future<List<UserModel?>?> getUserListBySearch(
      {int limit = 10, required GeoPoint geoPoint}) async {
    try {
      final userModel =
          ref.read(ProfileController.userControllerProvider).userModel!;

      String query =
          "lng=${userModel.position!.geopoint[0]}&lat=${userModel.position!.geopoint[1]}&distance=5000000&userId=${userModel.id}";
      final response = await httpTemplate.get(
        "users/near/?$query",
      );

      // Check if response contains 'data' key and it's a Map

      if (response.containsKey('data') && response['data'] is List<dynamic>) {
        final List<dynamic> users = response['data'];
        // final Map<String, dynamic> userMap = response['data'];


        return (users).map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception(
            'Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e) {
      return [];
    }
  }

  Future<PaginatedUserResponse> getUserList(
      {int page = 1, int limit = 20}) async {
    try {
      final userModel = await getCurrentUser();
      // Defensive null check for position and geopoint list
      final geopoint = userModel.position?.geopoint;
      if (geopoint == null || geopoint.length < 2) {
        logger.e("User position or geopoint is null or incomplete");
        return PaginatedUserResponse(
          data: [],
          total: 0,
          page: page,
          totalPages: 0,
          hasNext: false,
          hasPrev: false,
        );
      }
      String query =
          "lng=${geopoint[0]}&lat=${geopoint[1]}&distance=50000000&userId=${userModel.id}&page=$page&limit=$limit";
      final response = await httpTemplate.get("/users/near/?$query");


      if (response.containsKey('data')) {
        final data = response['data'];

        // Handle different response structures
        if (data is Map<String, dynamic>) {
          // If data is a map, it might contain the actual paginated structure
          if (data.containsKey('data') && data['data'] is List) {
            return PaginatedUserResponse.fromJson(data);
          } else if (data.containsKey('users') && data['users'] is List) {
            // Convert to expected structure
            final convertedResponse = {
              'data': data['users'],
              'total': data['total'] ?? 0,
              'page': data['page'] ?? page,
              'totalPages': data['totalPages'] ?? 0,
              'hasNext': data['hasNext'] ?? false,
              'hasPrev': data['hasPrev'] ?? false,
            };
            return PaginatedUserResponse.fromJson(convertedResponse);
          } else {
            throw Exception('Unexpected data structure: $data');
          }
        } else if (data is List) {
          // If data is directly a list, wrap it in pagination structure
          final convertedResponse = {
            'data': data,
            'total': response['total'] ?? data.length,
            'page': response['page'] ?? page,
            'totalPages': response['totalPages'] ?? 1,
            'hasNext': response['hasNext'] ?? false,
            'hasPrev': response['hasPrev'] ?? false,
          };
          return PaginatedUserResponse.fromJson(convertedResponse);
        } else {
          throw Exception('Unexpected data type: ${data.runtimeType}');
        }
      } else {
        throw Exception(
            'Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e, st) {
      logger.e("Error fetching user list: $e $st");
      return PaginatedUserResponse(
        data: [],
        total: 0,
        page: page,
        totalPages: 0,
        hasNext: false,
        hasPrev: false,
      );
    }
  }

  Future<PaginatedUserResponse> getFilterList({
    required Map<String, dynamic> filters,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      // Prefer using a preloaded user from the controller, but fall back to fetching
      var currentUser =
          ref.read(ProfileController.userControllerProvider).userModel;
      currentUser ??= await getCurrentUser();
      final geopoint = currentUser.position?.geopoint;
      if (geopoint == null || geopoint.length < 2) {
        logger.e("User position or geopoint is null or incomplete");
        return PaginatedUserResponse(
          data: [],
          total: 0,
          page: page,
          totalPages: 0,
          hasNext: false,
          hasPrev: false,
        );
      }
      // Parse age range
      int? minAge;
      int? maxAge;
      if (filters['ageRange'] != null &&
          filters['ageRange'].toString().contains('-')) {
        final parts = filters['ageRange'].toString().split('-');
        minAge = int.tryParse(parts[0].trim());
        maxAge = int.tryParse(parts[1].replaceAll(RegExp(r'[^\d]'), '').trim());
      }
      // Build query params
      final params = <String, dynamic>{
        'lng': geopoint[0],
        'lat': geopoint[1],
        'distance': filters['distance'] ?? 100,
        'userId': currentUser.id,
        'page': page,
        'limit': limit,
        if (minAge != null) 'ageMin': minAge,
        if (maxAge != null) 'ageMax': maxAge,
        if (filters['position'] != null &&
            filters['position'].toString().isNotEmpty)
          'position': filters['position'],
        if (filters['hasPhotos'] == true) 'hasPhotos': true,
        if (filters['hasFacePics'] == true) 'hasFacePics': true,
        if (filters['hasAlbums'] == true) 'hasAlbums': true,
        if (filters['lastSeen'] != null &&
            filters['lastSeen'].toString().isNotEmpty)
          'lastSeen': filters['lastSeen'],
        if (filters['interests'] != null &&
            (filters['interests'] as List).isNotEmpty)
          'interests': (filters['interests'] as List).join(','),
        if (filters['heightRange'] != null &&
            filters['heightRange'].toString().isNotEmpty)
          'heightRange': filters['heightRange'],
        if (filters['weightRange'] != null &&
            filters['weightRange'].toString().isNotEmpty)
          'weightRange': filters['weightRange'],
        if (filters['language'] != null &&
            filters['language'].toString().isNotEmpty)
          'language': filters['language'],
      };
      final uriParams = params.entries
          .map((e) => "${e.key}=${Uri.encodeComponent(e.value.toString())}")
          .join('&');
      final response = await httpTemplate.get("/users/discover?$uriParams");


      if (response.containsKey('data')) {
        final data = response['data'];

        // Handle different response structures
        if (data is Map<String, dynamic>) {
          // If data is a map, it might contain the actual paginated structure
          if (data.containsKey('data') && data['data'] is List) {
            return PaginatedUserResponse.fromJson(data);
          } else if (data.containsKey('users') && data['users'] is List) {
            // Convert to expected structure
            final convertedResponse = {
              'data': data['users'],
              'total': data['total'] ?? 0,
              'page': data['page'] ?? page,
              'totalPages': data['totalPages'] ?? 0,
              'hasNext': data['hasNext'] ?? false,
              'hasPrev': data['hasPrev'] ?? false,
            };
            return PaginatedUserResponse.fromJson(convertedResponse);
          } else {
            throw Exception('Unexpected data structure: $data');
          }
        } else if (data is List) {
          // If data is directly a list, wrap it in pagination structure
          final convertedResponse = {
            'data': data,
            'total': response['total'] ?? data.length,
            'page': response['page'] ?? page,
            'totalPages': response['totalPages'] ?? 1,
            'hasNext': response['hasNext'] ?? false,
            'hasPrev': response['hasPrev'] ?? false,
          };
          return PaginatedUserResponse.fromJson(convertedResponse);
        } else {
          throw Exception('Unexpected data type: ${data.runtimeType}');
        }
      } else {
        throw Exception(
            'Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e, st) {
      logger.e("Error fetching user list: $e $st");
      return PaginatedUserResponse(
        data: [],
        total: 0,
        page: page,
        totalPages: 0,
        hasNext: false,
        hasPrev: false,
      );
    }
  }

  Future<UserModel?> getUserById(String id) async {
    final user = await httpTemplate.get("/users/$id");
    return UserModel.fromJson(user['data']);
    // return users;
  }

  Future<void> addToBlockList(
      {required String id, required int cubeId}) async {}

  Future removeToBlockList({required String id, required int cubeId}) async {}

  Future<List<UserModel?>> getBlockList() async {
    return [];
  }

  Future<String> updateImage(String path) async {
    final value = await ref
        .read(Dependency.firebaseStorageProvider)
        .ref("image")
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(File(path));

    final image = await value.ref.getDownloadURL();
    return image;
  }

  Future<List<UserModel?>?> searchUser(String query) async {
    // final usercollection = userCollection();

    // final docs = usercollection.where("username", isGreaterThanOrEqualTo: query).get();

    // final data = await docs.then((value) => value.docs.map((e) => e.data()).toList());

    // logger.i(data.length);
    // return data;
    return [];
  }

  Future<FavoriteResponse> addUserToFavorite(String id) async {
    // final userCollection = FirebaseFirestore.instance.collection('users');
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    try {
      logger.i("Adding user $id to favorites for user $currentUserId");

      final response = await httpTemplate.post(
        "/users/$currentUserId/favourite/$id", // Changed from 'favorite' to 'favourite'
        body: {
          'action': 'add_favorite',
          'targetUserId': id,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      logger.i("Add to favorite response: $response");

      // Handle different response structures
      if (response.containsKey('data')) {
        return FavoriteResponse.fromJson(response['data']);
      } else {
        return FavoriteResponse.fromJson(response);
      }
    } catch (e) {
      logger.e("Error adding user to favorites: $e");
      rethrow;
    }

    // if (currentUserId != null) {
    //   await userCollection.doc(currentUserId).update({
    //     "favoriteList": FieldValue.arrayUnion([id]),
    //   });
    // }
  }

  Future<FavoriteResponse> removeUserFromFavorite(String id) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    try {
      logger.i("Removing user $id from favorites for user $currentUserId");

      final response = await httpTemplate.delete(
          "/users/$currentUserId/favourite/$id"); // Changed from 'favorite' to 'favourite'

      logger.i("Remove from favorite response: $response");

      // Handle different response structures
      if (response.containsKey('data')) {
        return FavoriteResponse.fromJson(response['data']);
      } else {
        return FavoriteResponse.fromJson(response);
      }
    } catch (e) {
      logger.e("Error removing user from favorites: $e");
      rethrow;
    }
  }

  Future<TapResponse> sendTap(String targetUserId) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('No current user logged in');
    }
    final response =
        await httpTemplate.post("/users/$currentUserId/tap/$targetUserId");
    return TapResponse.fromJson(response);
  }

  Future<UserTapStats> getUserTapStats(String userId) async {
    final response = await httpTemplate.get("/users/$userId/taps");
    // Defensive: If API returns a top-level success/message/remainingTaps/tappedBy, wrap as needed
    if (response['success'] != null && response['message'] != null) {
      return UserTapStats.fromJson(response);
    } else if (response['data'] != null) {
      // Some APIs wrap the result in a 'data' key
      return UserTapStats.fromJson(response['data']);
    } else {
      // Defensive fallback: try to parse whatever is returned
      return UserTapStats.fromJson(response);
    }
  }

  /// Log that the current user visited another user's profile
  Future<ProfileVisitResponse> visitProfile(String targetUserId) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('No current user logged in');
    }
    final response =
        await httpTemplate.post("/users/$targetUserId/view/$currentUserId");
    return ProfileVisitResponse.fromJson(response["data"]);
  }

  /// Get the list of profiles the current user has visited
  Future<PaginatedVisitsResponse> getVisitedProfiles(
      {int page = 1, int limit = 20}) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('No current user logged in');
    }
    final response = await httpTemplate
        .get("/users/$currentUserId/visited?page=$page&limit=$limit");
    return PaginatedVisitsResponse.fromJson(response["data"]);
  }

  /// Get the list of users who have visited the current user's profile
  Future<PaginatedVisitsResponse> getProfileVisitors(
      {int page = 1, int limit = 20}) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('No current user logged in');
    }
    final response = await httpTemplate
        .get("/users/$currentUserId/visitors?page=$page&limit=$limit");
    return PaginatedVisitsResponse.fromJson(response["data"]);
  }

  /// Upload a new profile picture for admin verification
  Future<Map<String, dynamic>> uploadProfilePicture(String photoUrl) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('No current user logged in');
    }
    
    try {
      final response = await httpTemplate.post(
        "/users/profile-picture",
        body: {
          "userId": currentUserId,
          "url": photoUrl,
        },
      );
      return response;
    } catch (e) {
      logger.e("Error uploading profile picture: $e");
      rethrow;
    }
  }

  /// Get profile picture verification status
  Future<Map<String, dynamic>> getProfilePictureStatus() async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('No current user logged in');
    }
    
    try {
      final response = await httpTemplate.get(
        "/users/$currentUserId/profile-picture-status",
      );
      return response;
    } catch (e) {
      logger.e("Error getting profile picture status: $e");
      rethrow;
    }
  }
}