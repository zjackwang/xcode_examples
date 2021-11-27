//
//  ContentView.swift
//  WarGame
//
//  Created by Jack Wang on 11/24/21.
//

import SwiftUI

struct ContentView: View {
    
    // State property (special, mutable)
    //  - Updates in code
    //  - notifies UI thread
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {
        
    
        ZStack() {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
            VStack() {
                Spacer()
                Image("logo")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack() {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(
                    action: {
                        // Generate random number
                        let playerRand = Int.random(in: 2...14)
                        let cpuRand = Int.random(in: 2...14)
                        
                        // Update cards!
                        // self is immutable
                        // need property wrapper
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" + String(cpuRand)
                        
                        // Update score
                        if playerRand > cpuRand {
                            playerScore += 1
                        } else if cpuRand > playerRand {
                            cpuScore += 1
                        }
                    },
                    label: {
                            Image("dealbutton")
                    })
                 Spacer()
                HStack() {
                    Spacer()
                    VStack() {
                        Text("Player")
                            .foregroundColor(Color.white)
                            .font(.headline)
                        Text(String(playerScore))
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                        .frame(width: 50)
                    VStack() {
                        Text("CPU")
                            .foregroundColor(Color.white)
                            .font(.headline)
                        Text(String(cpuScore))
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
