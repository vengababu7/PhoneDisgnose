//
//  CameraViewController.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController,UINavigationControllerDelegate{
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var retakeButton: UIButton!
    
    @IBOutlet weak var captureImage: UIImageView!
    var image = UIImageView()
    var label:UILabel!
    var overView:UIView!
    var countDown:Timer!
    var count = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.image.image = nil
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.blue.cgColor
        
        retakeButton.layer.borderWidth = 1
        retakeButton.layer.borderColor = UIColor.green.cgColor
        self.makeTheOverLay()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.image.image == nil{
            self.retakeButton.isHidden = true
        }else{
            self.retakeButton.isHidden = false
        }
    }
    
    @IBAction func retakeTheImage(_ sender: Any) {
        count = 0
        chooseFromCamera()
    }
    
    @IBAction func startTest(_ sender: UIButton) {
        if sender.isSelected {
            self.navigationController?.popViewController(animated: true)
        }else{
            self.chooseFromCamera()
            startButton.isSelected = true
        }
    }
    
    // open the camera to capture the image
    func chooseFromCamera()
    {
    
        let deadline  = DispatchTime.now() + .seconds(4)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePickerObj = UIImagePickerController()
            imagePickerObj.delegate = self
            imagePickerObj.sourceType = UIImagePickerController.SourceType.camera;
            imagePickerObj.cameraDevice = .front
            imagePickerObj.showsCameraControls = false
            imagePickerObj.cameraFlashMode = .off
            imagePickerObj.cameraOverlayView = overView
            
            self.present(imagePickerObj, animated: true, completion: nil)
            if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
                self.runTheTimer()
                DispatchQueue.main.asyncAfter(deadline: deadline) {
                    imagePickerObj.takePicture()
                }
            }else{
                AVCaptureDevice.requestAccess(for:  AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
                    if granted == true {
                        self.runTheTimer()
                        DispatchQueue.main.asyncAfter(deadline: deadline) {
                            imagePickerObj.takePicture()
                        }
                    } else {
                        // User Rejected
                    }
                })
            }
        }
        else
        {
            print("No camera found")
        }
    }
    
    // starting the timer for countdown
    func runTheTimer()  {
        countDown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    // updating the coundown label
    @objc func updateCounting() {
        count = count + 1
        label.text = "\(count)"
        if count == 4{
            countDown.invalidate()
            label.text = ""
        }
    }
    
    //Creating coundown over to camera
    func makeTheOverLay()  {
        overView  = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height))
        label = UILabel.init(frame: CGRect(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2, width: 30, height: 65))
        label.text = ""
        label.font = label.font.withSize(55)
        label.textColor = UIColor.white
        self.overView.addSubview(label)
    }

}

// MARK: - ImagePicker delegate method
extension CameraViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagePicked  = info[.originalImage] as? UIImage {
            self.image.image = imagePicked
            self.captureImage.image = imagePicked
            //  UIImageWriteToSavedPhotosAlbum(imagePicked, nil, nil, nil)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

