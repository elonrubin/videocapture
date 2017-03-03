//
//  CustomOverlayView.swift
//  VideoCaptureDemo
//
//  Created by Elon Rubin on 3/2/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation
import UIKit

protocol CustomOverlayDelegate{
    func didShoot(overlayView:CustomOverlayView, shouldStart:Bool)
    func didSave(overlayView:CustomOverlayView)
}

class CustomOverlayView: UIView {
    
    @IBOutlet weak var saveButton: UIButton!
 
    @IBOutlet weak var shootButton: UIButton!
    
    @IBOutlet weak var refreshButton: UIButton!

    @IBOutlet weak var videoCompleteLabel: UILabel!

    
      var delegate:CustomOverlayDelegate! = nil
 


    @IBAction func shootButton(_ sender: Any) {
        if (!shootButton.isSelected) {
            shootButton.isSelected = true
            delegate.didShoot(overlayView: self, shouldStart: true)
        } else {
            videoCompleteLabel.isHidden = false
            shootButton.isSelected = false
            refreshButton.isHidden = false
            shootButton.isHidden = true
            delegate.didShoot(overlayView: self, shouldStart: false)
            saveButton.isHidden = false
        }
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        
     delegate.didSave(overlayView: self)
        videoCompleteLabel.isHidden = true

        shootButton.isHidden = false
        saveButton.isHidden = true
        refreshButton.isHidden = true
    }
    
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
            shootButton.isSelected = false
            shootButton.isHidden = false
            videoCompleteLabel.isHidden = true
            saveButton.isHidden = true
            refreshButton.isHidden = true
        //    delegate.didShoot(overlayView: self, shouldStart: true)
    }
    
    


}
