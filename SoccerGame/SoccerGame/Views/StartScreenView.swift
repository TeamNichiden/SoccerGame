//
//  StartScreenView.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/20.
//

import SwiftUI

struct StartScreenView: View {
    @State var showPlayer:Bool = false
    @State var degree = 0.0
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TitleView
                    Spacer()
                    BallView
                    Spacer()
                    ButtonView
                        .padding()
                    
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
                .frame(width:90)
                .rotationEffect(.degrees(degree))
                .onAppear {
                    withAnimation(.linear(duration: 0.3)
                        .speed(0.1).repeatForever(autoreverses: false)) {
                            degree = 360.0
                        }
                }
            
            Image("Rings")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
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
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(10)
            .padding()
    }
}

#Preview {
    StartScreenView()
}
