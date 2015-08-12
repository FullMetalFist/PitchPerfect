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
    var receivedAudio: RecordedAudio!
    
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)
        
        playSound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: UIButton) {
        println("in playSlow")
        audio.stop()
        audio.rate = 0.5
        audio.currentTime = 0.0 // restart to beginning of audio
        audio.play()
    }
    
    @IBAction func playFast(sender: UIButton) {
        audio.stop()
        audio.rate = 1.5
        audio.currentTime = 0.0
        audio.play()
    }
    
    @IBAction func chipmunk(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func vader(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    @IBAction func stop(sender: UIButton) {
        audio.stop()
    }
    
    func playSound() {
        audio = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audio.enableRate = true
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
    
    func playAudioWithVariablePitch(pitch: Float) {
        audio.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
}
