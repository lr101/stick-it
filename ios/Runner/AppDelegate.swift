import UIKit
import Flutter
import google_mobile_ads

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      //GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ GADSimulatorID ]
      // register ad factory


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
