//
//  ShootModel.swift
//  SoccerGame
//
//  Created by Yuki Imai on 2024/07/20.
//

import Foundation

class ShootModel {
    
    func judgeShootDirection(balldirection: String,keeperdirection: String) -> Bool {
        if balldirection == keeperdirection {
            return true
        } else {
            return false
        }
    }
    
    func calPower(power: Int) -> String {
        switch power {
        case 0...3:
            return "low"
        case 3...6:
            return "middle"
        case 6...9:
            return "high"
        default:
            return "miss"
        }
    }
    
    func judgeShootHeight(ballheight: String,keeperheight: String) -> Bool {
        if ballheight == keeperheight {
            return true
        } else {
            return false
        }
    }
    
}
