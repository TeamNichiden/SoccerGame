//
//  StartScreenView.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/20.
//

import SwiftUI

struct StartScreenView: View {
    @EnvironmentObject<SoundManager> var soundManager
    @State var addWidth : Int = 0
    @State var showPlayer:Bool = false
    @State var degree = 0.0
    @State var showSetting:Bool = true
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TitleView
                    SettingIcon
                    Spacer()
                    BallView
                        .padding()
                    Spacer()
                    ButtonView
                        .padding()
                } 
                if showSetting{
                    SettingView(showSetting:$showSetting)
                        .cornerRadius(40)
                        .shadow(color: .gray, radius: 20, x: 0.0, y: 0.0)
                        .padding()
                        .padding(.bottom,50)
                    Spacer()
                }
            }
        }
        
    }
    
}


extension StartScreenView{
    private var ButtonView:some View{
        HStack{
            Image("Shoot")//キャラ選べるようにする
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:80)
                .padding()
            Spacer()
            NavigationLink {
                EmptyView()
            } label: {
                Image("StartButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:80)
                    .padding()
                
            }
            
            Spacer()
            Image("Highscore")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:80)
                .padding()
                .onTapGesture {
                    print("highscores")
                }
        }
    }
    
    private var BallView:some View{
        ZStack{
            Image("Football")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60 + CGFloat(addWidth))
                .rotationEffect(.degrees(degree))
                .onAppear {
                    withAnimation(.bouncy(duration: 0.6)
                        .speed(0.9).repeatForever(autoreverses: true)) {
                            degree = 720
                            addWidth = 30
                        }
                }
            
            Image("Rings")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 310 + CGFloat(addWidth))
                .rotationEffect(.degrees(degree * -1))
                .onTapGesture {
                    showPlayer = true
                }
        }
        
    }
    private var TitleView:some View{
        Text("PKゲーム")
            .font(.system(size: 50))
            .bold()
            .frame(maxWidth: .infinity)
            .frame(height:55)
            .padding(.vertical,10)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(10)
            .padding()
    }
    
    private var SettingIcon:some View{
        HStack{
            Spacer()
            Image(systemName: "gearshape.fill")
                .font(.largeTitle)
                .padding(.trailing,30)
                .onTapGesture {
                    showSetting.toggle()
                    print("SettingViewshow.toggle")
                }
        }

    }
}

#Preview {
    StartScreenView()
}
