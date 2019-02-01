//
//  BlueTooth.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import Foundation
import CoreBluetooth
import UIKit

extension ViewController:CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn,.poweredOff,.resetting,.unauthorized:
            self.bluetoothReport = Report.success
            self.updateTheButton(success: true)
            break
        case .unsupported,.unknown:
            self.bluetoothReport =  Report.Failed
            self.updateTheButton(success: false)
            break
        default:
            break
        }
    }
    
    func updateTheButton(success:Bool) {
        if success{
            DispatchQueue.main.async {
                let image1:UIImage = UIImage(named: Images.bluetoothSelected)!
                self.bluetoothButton.setImage(image1, for: .normal)
                
            }
        }else{
            DispatchQueue.main.async {
                let image1:UIImage = UIImage(named: Images.bluetoothUnSelected)!
                self.bluetoothButton.setImage(image1, for: .normal)
            }
        }
    }
}
