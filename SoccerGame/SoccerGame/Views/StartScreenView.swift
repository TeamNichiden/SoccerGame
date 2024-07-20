//
//  StartScreenView.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/20.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                NavigationLink {
                    EmptyView()
                } label: {
                    Image("StartButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:80)
                    
                }
                
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    VStack{
                        Image("Highscore")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                    }
                    .onTapGesture {
                        print("highscores")
                    }
                    
                }
                
            }
            )
            
            
        }
        
    }
   
}

#Preview {
    StartScreenView()
}
