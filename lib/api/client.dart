import 'package:dart_appwrite/dart_appwrite.dart' as appwrite;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [dartClientProvider]
/// This provides a [appwrite.Client] object from `dart_appwrite` package.
/// Since the names of both classes are the same, we are using `as` to the
/// server client package
/// Just provide an secret key with all the neccessary permissions and it's ready
final dartclientProvider = Provider<appwrite.Client>((ref) {
  return appwrite.Client()
      .setEndpoint("http://localhost:5000/v1")
      .setProject("634406d334549be5ac18")
      .setKey(
          "40d064baaafd1299f6a7a3eec843ea3b773f6f86cffc49a20e9e1fdac3f73f34959af8539ef2c2473a036a0df22dae455c07c123372052250381e84fb415445094756c03f128c1b7a4fb0fa5ae66548fc2ee1fc3abd2d391c5dc368fbfbecba9bc1c6636e4c421095d95be9f67109d60198040cb525ab9d794fdae241878b963")
      .setSelfSigned(status: true);
});
