//
//  SoundManager.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/22.
//

import Foundation
import UIKit
import AVFoundation

class SoundManager{
    private var soundPlayer : AVAudioPlayer?
    
    func playSound(FileName:String,FileType:String,loop:Bool,volume:Float){
        guard let url = Bundle.main.url(forResource: FileName, withExtension: FileType) else{
        print("File not found")
            return
        }
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.numberOfLoops = loop ? -1 : 0
            soundPlayer?.volume = volume
            soundPlayer?.play()
        }catch let error{
            print("SoundPlayer can't be created\(error.localizedDescription)")
        }
        
    }
    
    func stopSound(){
        soundPlayer?.stop()
    }
    
    
}
