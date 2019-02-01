//
//  ViewControllerExtension.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    func updateMicroPhoneButton(success:Bool) {
        if success{
            DispatchQueue.main.async {
                self.microPhoneReport = Report.success
                let image1:UIImage = UIImage(named: Images.microphoneSelected)!
                self.microPhoneButton.setImage(image1, for: .normal)
            }
        }else{
            DispatchQueue.main.async {
                self.microPhoneReport = Report.Failed
                let image1:UIImage = UIImage(named: Images.microPhoneUnselected)!
                self.microPhoneButton.setImage(image1, for: .normal)
            }
        }
    }
    
    func updateSpeakerButton(success:Bool) {
        if success{
            DispatchQueue.main.async {
                self.speakerReport = Report.success
                let image1:UIImage = UIImage(named: Images.speakerSelected)!
                self.speakerButton.setImage(image1, for: .normal)
            }
        }else{
            DispatchQueue.main.async {
                self.speakerReport = Report.Failed
                let image1:UIImage = UIImage(named: Images.speakerSelected)!
                self.speakerButton.setImage(image1, for: .normal)
            }
        }
    }
    
    func updateSensorAccelerometer(success:Bool) {
        if success{
            DispatchQueue.main.async {
                self.sensorAcceleroReport = Report.success
                let image1:UIImage = UIImage(named: Images.sensorSelected)!
                self.acceleroMeterButton.setImage(image1, for: .normal)
            }
        }else{
            DispatchQueue.main.async {
                self.sensorAcceleroReport = Report.Failed
                let image1:UIImage = UIImage(named: Images.sensorUnSelected)!
                self.acceleroMeterButton.setImage(image1, for: .normal)
            }
        }
    }
    
    func updateSensorGyro(success:Bool) {
        if success{
            DispatchQueue.main.async {
                self.sensorGyruReport = Report.success
                let image1:UIImage = UIImage(named: Images.sensorSelected)!
                self.gyroButton.setImage(image1, for: .normal)
            }
        }else{
            DispatchQueue.main.async {
                self.sensorGyruReport = Report.Failed
                let image1:UIImage = UIImage(named: Images.sensorUnSelected)!
                self.gyroButton.setImage(image1, for: .normal)
            }
        }
    }
    
    func updateSensorMagnetor(success:Bool) {
        self.startButton.isSelected = true
        self.startButton.isUserInteractionEnabled = true
        self.startButton.layer.borderColor = UIColor.green.cgColor
        if success{
            DispatchQueue.main.async {
                self.sensorMagnetorReport = Report.success
                let image1:UIImage = UIImage(named: Images.sensorSelected)!
                self.magnetoMeter.setImage(image1, for: .normal)
            }
            
        }else{
            DispatchQueue.main.async {
                self.sensorMagnetorReport = Report.Failed
                let image1:UIImage = UIImage(named: Images.sensorUnSelected)!
                self.magnetoMeter.setImage(image1, for: .normal)
            }
        }
    }
}
