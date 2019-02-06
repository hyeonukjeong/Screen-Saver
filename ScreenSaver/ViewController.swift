//
//  ViewController.swift
//  ScreenSaver
//
//  Created by Jeong Hyeon Uk on 11/01/2019.
//  Copyright © 2019 Hyeonuk Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var batteryPercentLabel: UILabel!
    
    var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    
    var batteryState: UIDevice.BatteryState {
        return UIDevice.current.batteryState
    }
    
    var batteryMode: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.isBatteryMonitoringEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange), name: UIDevice.batteryStateDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangePowerMode(_:)), name: Notification.Name.NSProcessInfoPowerStateDidChange, object: nil)
        batteryPercentLabel.text = String("\(Int((batteryLevel) * 100))%")
        print("JHU || \(Int((batteryLevel) * 100))%")
    }

    @objc func batteryLevelDidChange(_ notification: Notification) {
        batteryPercentLabel.text = String("\(Int((batteryLevel) * 100))%")
        print("JHU || \(Int((batteryLevel) * 100))%")
    }
    
    @objc func batteryStateDidChange(_ notification: Notification) {
        switch batteryState {
        case .unknown:
            print("Unknown")
        case .unplugged:
            print("Unplugged")
        case .charging:
            print("Charging")
        case .full:
            print("Full")
        }
    }
    
    @objc func didChangePowerMode(_ notification: NSNotification) {
        if ProcessInfo.processInfo.isLowPowerModeEnabled {
            // low power mode on
        } else {
            // low power mode off
        }
    }

}

