//
//  Parse Methods.swift
//  VideoCaptureDemo
//
//  Created by Elon Rubin on 3/2/17.
//  Copyright © 2017 Elon Rubin. All rights reserved.
//

import Foundation
import Parse

typealias CompletionHandler = (_ success: Bool, _ error: Error?) -> Void

class ParseMethods {
    
 
    
    static func signUpUserWith(username: String, password: String, completion: @escaping CompletionHandler) {
        let user = PFUser()
        user.username = username
        user.password = password
        user.signUpInBackground(block: { (success, error) in
            print("going")
            if (success) {
                completion(true, nil)
            } else {
                // handle error
                completion(false, error)
            }
        })        
    }
    
    static func signInUser(username: String, password: String, completion: @escaping CompletionHandler) {
     
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if error == nil {
                
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
        
    }
    
    
    static func saveVideo (videoFile: PFFile, completion: @escaping CompletionHandler) {
        let videoObject = PFObject(className: "Video")
        videoObject["video"] = videoFile
        videoObject["fromUser"] = PFUser.current()!
        videoObject.saveInBackground { (saved, error) in
            if (saved) {
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }
}
