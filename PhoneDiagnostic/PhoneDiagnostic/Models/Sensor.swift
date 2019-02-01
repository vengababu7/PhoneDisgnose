//
//  Sensor.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import Foundation
import CoreMotion

class Sensor {
    let motionManager = CMMotionManager()
    func getTheMotionStatus(onCompletion:@escaping(Bool)->())  {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (accelerometerData, error) in
                guard let _ = accelerometerData, error == nil else {
                  onCompletion(false)
                    return
                }
                  onCompletion(true)
                //handle data here
            }
        }
    }
    
    func startGyroUpdates(onCompletion:@escaping(Bool)->())  {
        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: OperationQueue.main) { (gyroData, error) in
                guard let _ = gyroData, error == nil else {
                    /// Report an error.
                    onCompletion(false)
                    return
                }
                onCompletion(true)
                //handle data here
            }
        }
    }
    
    func startMagnetometerUpdates(onCompletion:@escaping(Bool)->())  {
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            motionManager.startMagnetometerUpdates(to: OperationQueue.main) { (magnetometerData, error) in
                guard let _ = magnetometerData, error == nil else {
                    /// Report an error.
                    onCompletion(false)
                    return
                }
                onCompletion(true)
                //handle data here
            }
        }
    }
}
