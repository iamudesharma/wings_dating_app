pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.0" apply false
    // Kotlin Gradle Plugin: bump to match plugin binaries (device_info_plus uses Kotlin 2.2.x)
    // Minimum recommended by Flutter is 2.1.0; use 2.2.0 to avoid "Module was compiled with an incompatible version" errors
    id("org.jetbrains.kotlin.android") version "2.2.0" apply false
     // START: FlutterFire Configuration
    id ("com.google.gms.google-services") version "4.3.15" apply false

    // END: FlutterFire Configuration

}

include(":app")
