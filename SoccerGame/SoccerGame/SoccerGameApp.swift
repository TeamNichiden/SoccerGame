//
//  SoccerGameApp.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/20.
//

import SwiftUI

@main
struct SoccerGameApp: App {
    @StateObject var soundManager = SoundManager()
    var body: some Scene {
        WindowGroup {
            StartScreenView()
                .environmentObject(soundManager)
        }
    }
}
