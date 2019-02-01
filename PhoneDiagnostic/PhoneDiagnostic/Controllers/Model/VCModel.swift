//
//  ImageModel.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import Foundation


class EmailData {
    var bluetooth = ""
    var microphone = ""
    var speaker = ""
    var accelerometer = ""
    var gyro = ""
    var magnetometer = ""
    init(blueTooth:String,microPhonTest:String,speakerTest:String,sensorAcc:String,sensorGyro:String,sensorMagnetometr:String) {
        self.bluetooth = blueTooth
        self.microphone = microPhonTest
        self.speaker = speakerTest
        self.accelerometer = sensorAcc
        self.gyro = sensorGyro
        self.magnetometer = sensorMagnetometr
    }
}

class MakeReport {
    var finalReport = ""
    init(emailData:EmailData) {
        self.finalReport = "Bluetooth :" + emailData.bluetooth + "\n" + "MicroPhone :" + emailData.microphone + "\n" +  "Speaker :" + emailData.speaker + "\n" +  "SensorAcceleroMeter :" + emailData.accelerometer + "\n" + "SensorGyro :" + emailData.gyro + "\n" + "SensorMagentoMeter :" + emailData.magnetometer
        
    }
}
