//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Michael Vilabrera on 7/19/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingOutlet: UIButton!
    @IBOutlet weak var recordingOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.stopRecordingOutlet.hidden = true
        self.recordingOutlet.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        self.recordingLabel.hidden = false
        self.stopRecordingOutlet.hidden = false
        self.recordingOutlet.enabled = false
        //TODO: Record the user's voice
        println("in recordAudio")
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        self.recordingLabel.hidden = true
        self.stopRecordingOutlet.hidden = true
        self.recordingOutlet.enabled = true
        //TODO: Stop recording user's voice
        println("in stopRecording")
    }
}

