//
//  GameScreenView.swift
//  SoccerGame
//
//  Created by Hlwan Aung Phyo on 2024/07/20.
//


import SwiftUI

let houkou = ["arrow.up.backward.circle.fill","arrow.up.circle.fill","arrow.up.right.circle.fill"]

struct GameScreenView: View {
    @State var chikara: Bool = false
    @State var choosechikara: Bool = false
    @State var choose: Bool = true
    
    @State var yellowposition: Bool = true
    @State var blueposition: Bool = true
    @State var greenposition: Bool = true
    
    var body: some View {
        VStack {
            //Goal
            ZStack {
                Image("Football icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                //ball_final_posion
                //yellow
                if yellowposition {
                    VStack {
                        ForEach(0..<3) { img in
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(.yellow)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)
                        }
                    }
                    .offset(x:-110)
                }
                //blue
                if blueposition {
                    VStack {
                        ForEach(0..<3) { img in
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(.blue)
                                .padding(.horizontal,30)
                                .padding(.vertical, 10)
                        }
                    }
                }
                //green
                if greenposition {
                    VStack {
                        ForEach(0..<3) { img in
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(.green)
                                .padding(.horizontal,30)
                                .padding(.vertical, 10)
                        }
                    }
                    .offset(x:110)
                }
                //----
            }
            //キーパー
            //ボール
            ZStack {
                Image(systemName: "soccerball")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .offset(x: 10, y: 20)
                //キャラクター
                Image("Player1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                    .position(x: 100,y: 200)
                
                //choose２：力選ぶ
                if choosechikara {
                    chikaraView()
                        .position(x: 330, y: 100)
                }
            }
            
            //方向選択
            HStack {
                ForEach (houkou, id: \.self) { name in
                    Button(action: {
                        //動作
                        //choose２：力選ぶ
                        choose = false
                        choosechikara = true
                        goalresult(name)
                    }) {
                        if choose {
                            Image(systemName:(name))
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        //reset_
        Button(action: {
            //Button
            choosechikara = false
            choose = true
            
            yellowposition = true
            blueposition = true
            greenposition = true
        }) {
            Label(
                title: { Text("Reset") },
                icon: { Image(systemName: "42.circle") }
            )
            .padding(.top)
        }
    }
    //switch case
    func goalresult(_ direction: String) {
        
        switch direction {
            
        case "arrow.up.backward.circle.fill":
            //            yellowposition = true
            blueposition = false
            greenposition = false
        case "arrow.up.circle.fill":
            yellowposition = false
            //            blueposition = true
            greenposition = false
        case "arrow.up.right.circle.fill":
            yellowposition = false
            blueposition = false
            //            greenposition = true
        default:
            yellowposition = false
            blueposition = false
            greenposition = false
        }
    }
}


#Preview {
    GameScreenView()
}
