import CGMBLEKit
import Flutter
import HealthKit
import LoopKit
import UIKit
import os.log

public class SwiftCgmblekitFlutterPlugin: NSObject, FlutterPlugin, CBKApi {
    private var cgmManager: TransmitterManager!
    private var callbackApi: CBKCallbackApi!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: CBKApi = SwiftCgmblekitFlutterPlugin(messenger)
        CBKApiSetup(messenger, api)
    }
    
    init(_ binaryMessenger: FlutterBinaryMessenger) {
        self.callbackApi = CBKCallbackApi(binaryMessenger: binaryMessenger);
    }
    
    public func listen(for input: CBKTransmitter, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> Void {
        cgmManager = G6CGMManager(state: TransmitterManagerState(transmitterID: input.id!))
        cgmManager.cgmManagerDelegate = self
        cgmManager.delegateQueue = .main
    }
}

// MARK: CGMManagerDelegate
extension SwiftCgmblekitFlutterPlugin: CGMManagerDelegate {
    public func scheduleNotification(for manager: DeviceManager, identifier: String, content: UNNotificationContent, trigger: UNNotificationTrigger?) {
        // TODO
        os_log("scheduleNotification")
    }
    
    public func clearNotification(for manager: DeviceManager, identifier: String) {
        // TODO
        os_log("clearNotification")
    }
    
    public func removeNotificationRequests(for manager: DeviceManager, identifiers: [String]) {  // TODO
        os_log("removeNotificationRequests")
    }
    
    public func deviceManager(_ manager: DeviceManager, logEventForDeviceIdentifier deviceIdentifier: String?, type: DeviceLogEntryType, message: String, completion: ((Error?) -> Void)?) {
        // TODO
        os_log("deviceManager")
    }
    
    public func issueAlert(_ alert: Alert) {
        // TODO
        os_log("issueAlert")
    }
    
    public func retractAlert(identifier: Alert.Identifier) {
        // TODO
        os_log("retractAlert")
    }
    
    public func startDateToFilterNewData(for manager: CGMManager) -> Date? {
        // TODO
        os_log("startDateToFilterNewData")
        return nil
    }
    
    public func cgmManager(_ manager: CGMManager, hasNew readingResult: CGMReadingResult) {
        // TODO
        os_log("cgmManager.hasNew")
        switch readingResult {
        case .newData(let values):
            let value = values.last!
            let sample = CBKGlucoseSample()
            sample.timestamp = value.date.timeIntervalSince1970 as NSNumber
            sample.quantity = NSNumber(value: Int(value.quantity.doubleValue(for: HKUnit(from: "mg/dL"), withRounding: true)))
            DispatchQueue.main.async {
                self.callbackApi.newSample(sample, completion: { (error: Error?) -> Void in
                    })
            }
        default:
            os_log("doesn't have new data")
        }
    }
    
    public func cgmManager(_ manager: CGMManager, didUpdate status: CGMManagerStatus) {
        // TODO
        os_log("cgmManager.didUpate")
    }
    
    public func cgmManagerWantsDeletion(_ manager: CGMManager) {
        // TODO
        os_log("cgmManagerWantsDeletion")
    }
    
    public func cgmManagerDidUpdateState(_ manager: CGMManager) {
        // TODO
        os_log("cgmManagerDidUpdateState")
    }
    
    public func credentialStoragePrefix(for manager: CGMManager) -> String {
        // TODO
        os_log("credentialStoragePrefix")
        return "com.drewmacneil.cgmblekit_flutter"
    }
}
