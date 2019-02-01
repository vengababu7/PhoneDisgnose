//
//  DataModel.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import Foundation

struct Images {
    
    static let bluetoothSelected = "Bluetooth selected"
    static let bluetoothUnSelected = "Bluetooth unselected"
    static let bluetoothdefault = "Group 14"
    
    
    static let speakerSelected = "Speaker selected"
    static let speakerUnselected = "Speaker unselected"
    static let speakerdefault = "Group 12"
    
    static let microphoneSelected = "Mike selected"
    static let microPhoneUnselected = "Mike unselected"
    static let microPhonedefault = "Group 13"
    
    static let sensorSelected = "Sensor selected"
    static let sensorUnSelected = "Sensor unselected"
    static let sensordefault = "Group 11"
    
    
}

struct Report {
    static let success  = "Success"
    static let Failed  = "Failed"
    static let running = "Test Running"
}

struct AlertData {
    static let cantSentMail       = "Could Not Send Email"
    static let noEmailAct         = "Your device could not send e-mail.  Please check e-mail configuration and try again."
    static let report = "Diagnose test report"
    static let ok = "ok"
}
