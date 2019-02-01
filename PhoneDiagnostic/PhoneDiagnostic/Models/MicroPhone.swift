//
//  MicroPhone.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import AVFoundation
import Foundation

class MicroPhone {
    var statusMicrophone: PermissionStatus {
        let status = AVAudioSession.sharedInstance().recordPermission
        
        switch status {
        case AVAudioSession.RecordPermission.denied:
            return .denied
        case AVAudioSession.RecordPermission.granted:
            return .authorized
        default:
            return .notDetermined
        }
    }
    
    func requestMicrophone(onCompletion:@escaping (Bool)->()) {
        AVAudioSession.sharedInstance().requestRecordPermission { _ in
            if self.statusMicrophone == .notDetermined || self.statusMicrophone == .disabled{
                onCompletion(false)
            }else{
                onCompletion(true)
            }
        }
    }
}
