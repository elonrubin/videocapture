//
//  ViewController.swift
//  VideoCaptureDemo
//
//  Created by Elon Rubin on 3/2/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit
import AVFoundation
import Parse
import SwiftSpinner

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CustomOverlayDelegate {

    let imagePicker: UIImagePickerController! = UIImagePickerController()
    let saveFileName = "/test.mp4"
    var shotVideoURL: URL?
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presentVideoView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func presentVideoView () {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
                
                imagePicker.sourceType = .camera
                imagePicker.mediaTypes = [kUTTypeMovie as String]
                imagePicker.allowsEditing = false
                imagePicker.delegate = self
                imagePicker.showsCameraControls = false
                
          
                let customViewController = CustomOverlayViewController(
                    nibName:"CustomOverlayViewController",
                    bundle: nil
                )
                let customView:CustomOverlayView = customViewController.view as! CustomOverlayView
                customView.frame = self.imagePicker.view.frame
                
                customView.delegate = self
                self.imagePicker.cameraOverlayView = customView
                
                DispatchQueue.main.async {
                    self.present(self.imagePicker, animated: false, completion: {
                  
                    })
                    
                }
            }
        }
    }
    

  
// MARK: UIImagePickerControllerDelegate delegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Got a video")
        
        if let pickedVideo:URL = (info[UIImagePickerControllerMediaURL] as? URL) {
         
           print("extracted URL")
            shotVideoURL = pickedVideo
        }
    }


// Implementation of CustomOverlayViewProtocol
 
    func didShoot(overlayView:CustomOverlayView, shouldStart: Bool) {
 
        if (shouldStart) {
            imagePicker.startVideoCapture()
        } else {
            imagePicker.stopVideoCapture()
        }
        
    }
    
    func didSave(overlayView: CustomOverlayView) {
     
        do {
          
         SwiftSpinner.show("Saving Your Video")
            
         let videoData = try? Data(contentsOf: shotVideoURL!)
         let videoFile:PFFile = PFFile(name:"consent.mp4", data:videoData!)!
         ParseMethods.saveVideo(videoFile: videoFile, completion: { (saved, error) in
            if (saved) {
                SwiftSpinner.show("Video Saved!", animated: false).addTapHandler({
                    SwiftSpinner.hide()
                }, subtitle: "Tap to record another video")
                
            } else {
                
                SwiftSpinner.show("Video Save Error :(").addTapHandler({
                    SwiftSpinner.hide()
                }, subtitle: "There are some server issues. Tap on the save button to try again")
          
            }
         })
        }
    
    }
}

