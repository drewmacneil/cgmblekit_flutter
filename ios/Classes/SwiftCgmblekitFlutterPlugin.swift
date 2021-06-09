import Flutter
import UIKit

public class SwiftCgmblekitFlutterPlugin: NSObject, FlutterPlugin, CBKApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger : FlutterBinaryMessenger = registrar.messenger()
    let api : CBKApi = SwiftCgmblekitFlutterPlugin()
    CBKApiSetup(messenger, api)
  }

  public func getPlatformVersion(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> CBKVersion? {
    let version = CBKVersion.init()
    version.string = "iOS " + UIDevice.current.systemVersion
    return version
  }
}
