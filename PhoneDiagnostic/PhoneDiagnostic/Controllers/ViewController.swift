//
//  ViewController.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 31/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import UIKit
import CoreBluetooth
import AVFoundation
import MessageUI

class ViewController: UIViewController,MFMailComposeViewControllerDelegate {
    @IBOutlet weak var bluetoothButton: UIButton!
    @IBOutlet weak var speakerButton: UIButton!
    @IBOutlet weak var microPhoneButton: UIButton!
    @IBOutlet weak var acceleroMeterButton: UIButton!
    @IBOutlet weak var gyroButton: UIButton!
    @IBOutlet weak var magnetoMeter: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var manager:CBCentralManager!
    var microPhone = MicroPhone()
    var speaker = Speaker()
    var sensor = Sensor()
    var finalReport:String!
    
    var bluetoothReport  = ""
    var microPhoneReport = ""
    var speakerReport  = ""
    var sensorAcceleroReport  = ""
    var sensorGyruReport = ""
    var sensorMagnetorReport = ""
    
    override func viewDidLoad() {
        
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.blue.cgColor
        super.viewDidLoad()
        
    }
    
    
    func startTesting() {
        //for bluetooth checck
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            self.manager = CBCentralManager()
            self.manager.delegate = self
        }
        // for speaker check
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(4)) {
            self.speaker.playSound(onCompletion: { (success) in  //@locate Speaker.swift
                self.updateSpeakerButton(success: success) //@locate ViewcontrollerExtension.swift
                
            })
        }
        
        //for micro phone
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(6)) {
            self.microPhone.requestMicrophone(onCompletion: { (success) in //@locate MicroPhone.swift
                self.updateMicroPhoneButton(success: success) //@locate ViewcontrollerExtension.swift
            })
        }
        
        // for accelerometer
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(8)) {
            self.sensor.getTheMotionStatus(onCompletion: { (success) in //@locate Sensor.swift
                
                self.updateSensorAccelerometer(success: success) //@locate ViewcontrollerExtension.swift
            })
        }
        //for gyro
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(10)) {
            self.sensor.startGyroUpdates(onCompletion: { (success) in  //@locate Sensor.swift
                self.updateSensorGyro(success: success) //@locate ViewcontrollerExtension.swift
            })
        }
        // for
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(12)) {
            self.sensor.startMagnetometerUpdates(onCompletion: { (success) in  //@locate Sensor.swift
                
                self.updateSensorMagnetor(success: success) //@locate ViewcontrollerExtension.swift
                
            })
        }
        
    }
    
    
    
    @IBAction func startTheTest(_ sender: Any) {
        if startButton.isSelected{
            let report = EmailData.init(blueTooth: self.bluetoothReport, microPhonTest: self.microPhoneReport, speakerTest: self.speakerReport, sensorAcc: self.sensorAcceleroReport, sensorGyro: self.sensorGyruReport, sensorMagnetometr: self.sensorMagnetorReport)
            finalReport = MakeReport.init(emailData: report).finalReport
            updateToEmail()
        }else{
            startButton.setTitle(Report.running, for: .normal)
            startButton.isUserInteractionEnabled = false
            startButton.layer.borderColor = UIColor.lightGray.cgColor
            startTesting()
        }
    }
    
    //send the email data
    func updateToEmail()  {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        let referralText = AlertData.report
        mailComposerVC.setSubject(referralText)
        mailComposerVC.setMessageBody(finalReport!, isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "toTestScreen", sender: nil)
    }
    
    func showSendMailErrorAlert() {
        
        let sendMailErrorAlert = UIAlertController(title:
            AlertData.cantSentMail, message: AlertData.noEmailAct, preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: AlertData.ok, style: .default, handler: nil))
        self.present(sendMailErrorAlert, animated: true, completion:nil)
    }
}


