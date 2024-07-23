//
//  SettingView.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/22.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject<SoundManager> var soundManager
    @Binding var showSetting:Bool
    @State var muted:Bool = false
    
    var body: some View {
        VStack{
            
            CloseButton

//            MuteButton
            SliderView
                .padding()
            
            Spacer()
        }
        .frame(width: 350,height: 500)
        .background(.ultraThinMaterial)

    }
        
    
}




extension SettingView{
    private var MuteButton:some View{
        Button {
            soundManager.stopSound() //あとで編集必要
            muted.toggle()
            
        } label: {
            Image(systemName: muted ? "speaker.slash.fill" : "speaker.wave.3.fill")
                .font(.largeTitle)
                
            
            
        }
        .frame(width:100,height:100)
        .foregroundColor(.black)
        .font(.largeTitle)
    }
    
    private var SliderView:some View{
        HStack{
            Image(systemName: muted ? "speaker.slash.fill" : "speaker.wave.3.fill")
        
            Slider(value: $soundManager.volume) {
                Text("Adjust bc")
            }minimumValueLabel: {
                Text("")
                
            } maximumValueLabel: {
                Text("\(Int(soundManager.volume*100))")
            }
            
        }
    }
    private var CloseButton:some View{
        HStack{
            Spacer()
            Button {
                showSetting.toggle()
            } label: {
                Image(systemName:"xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.trailing,20)
                    .padding(.top,20)
            }
        }
    }
}

//#Preview {
//    SettingView()
//}
