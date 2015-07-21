//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Michael Vilabrera on 7/21/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audio: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playSound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: AnyObject) {
        println("in playSlow")
        audio.stop()
        audio.rate = 0.5
        audio.currentTime = 0.0 // restart to beginning of audio
        audio.play()
    }
    
    @IBAction func playFast(sender: AnyObject) {
        audio.stop()
        audio.rate = 1.5
        audio.currentTime = 0.0
        audio.play()
    }
    
    @IBAction func stop(sender: AnyObject) {
        audio.stop()
    }
    
    func playSound() {
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let url = NSURL.fileURLWithPath(filePath)
            audio = AVAudioPlayer(contentsOfURL: url, error: nil)
            audio.enableRate = true
        } else {
            println("the filePath is empty")
        }
    }
    
    func loadSound() {
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let url = NSURL.fileURLWithPath(filePath)
            audio = AVAudioPlayer(contentsOfURL: url, error: nil)
            audio.enableRate = true
        } else {
            println("the filePath is empty")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
