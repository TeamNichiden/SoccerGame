//
//  StartScreenView.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/20.
//

import SwiftUI

struct StartScreenView: View {
    
    @State var degree = 0.0
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                Image("bcpic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(90.0))
                    .scaleEffect(1.3)
                    .opacity(0.1)
                
                BallView
                
            VStack{
                
                Text("Soccer")
                    .font(.system(size: 50))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(height:55)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                    .padding()
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
            Image("shoot")//キャラ選べるようにする
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
    }
}

#Preview {
    StartScreenView()
}
