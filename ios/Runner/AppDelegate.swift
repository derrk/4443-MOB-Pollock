import UIKit
import Flutter
import GoogleMaps   // add this import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // add api key here
    GMSServices.provideAPIKey("AIzaSyAVrFndsno1ZJrpNVzbF8EDZbxphUXF2Qc")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
