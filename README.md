# Videocapture Notes

## Installation Instructions
* (1) Download or Clone Repo
* (2) Install Pods
  * Open Terminal
  * Type "cd + \(filepathToRootDirectory)"
    * You can drag the file directory to terminal
  * Once you are in, type "pod install"
* (3) Access Uploaded Video Files
   * You nave to get access to Parse Dashboard
    * Download Node JS [here] (https://nodejs.org/en/download/)
    * Your download target should be your desktop
     * Open Terminal
     * Type "cd desktop"
     * Then type "sudo npm install -g parse-dashboard"
     * Once this completes downloading, then type this command "parse-dashboard --appId videodemosdgf234tgh3rad --masterKey dffhtser342trefgt3 --serverURL "http://videostreamdemo.herokuapp.com/parse" --appName videostreamdemo". Press enter.
      * You should then see a url similar to "http://0.0.0.0:4040/" appear. Copy this, and open a web browser
      * You should have access at this point to the Parse backend

  ## How to Locate Uploaded Videos
  
  * Under Browser, click on Video class
  * In the Video class, there is a property called "video."
  * Videos uploaded are found in this column as MP4 files. You can click on a file to see it stream in your browser :)
  
  ## Requirements
  * After you sign in, you are taken to a video controller (UIImagePickerViewController)
  * Tap the button to begin recording a video
  * Stop recording the video by tapping the stop button
  * Tap the save button to save the video to the cloud. This prompts a saving animation while the video is being uploaded
  * Once an upload is complete, you get a confirmation prompt
  * Tap record another video to bring up the initial record button (so you can repeat the process)
  
  ## Other Notes
  * Given that this app utilizes camera and video, it's difficult to test it on a wide array of devices. The simulator does not have the ability to use a camera, so I only tested on an iPhone 6 plus
  * I recently updated to xCode 8.2.1. Apple has been changing provisioning requirements. While I don't think this will cause an issue, it possibly could. 
  * It is written in Swift 3.0, with a build target for 9.0 plus.
  * The backend is fully working. You could create user accounts 
  * I would look into, with more time, file compression to reduce size of videos uploaded and decompression when the video is called on the front end. Another alternative would be to enable streaing of the uploaded file. I would seek to discuss this.
  
  
   


