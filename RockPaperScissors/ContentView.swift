//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Luke Inger on 06/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    var actions = ["Rock", "Paper", "Scissors"]
    
    @State private var shouldWin = Bool.random()
    @State private var score:Int = 0
    @State private var appChoice:Int = Int.random(in: 0..<3)
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
            Text("App Move: \(self.actions[appChoice])")
            Text("Outcome: \(shouldWin ? "Win" : "Lose")")
            HStack{
                ForEach(0..<actions.count){ number in
                    Button(action:{
                        buttonTapped(number)
                    })
                    {
                        Text("\(self.actions[number])")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
    
    func buttonTapped(_ action:Int){
        
        var hasWon:Bool=false
        
        switch action {
        case 0:
            if (appChoice == 2){
                hasWon = true
            }
        case 1:
            if (appChoice == 0){
                hasWon = true
            }
        default:
            if (appChoice == 1){
                hasWon = true
            }
        }
        
        if (shouldWin && hasWon){
            self.score += 1
        } else {
            self.score += 1
        }
        
        newRound()
    }
    
    func newRound(){
        appChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
