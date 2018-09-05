//
//  Library.swift
//  VideoGameLibrary
//
//  Created by Zach Shearer on 9/4/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation


class Library {
    
    private var gameArray: [Game] = [Game(title: "League of Legends"), Game(title: "Fortnite"), Game(title: "Rainbow Six: Siege"), Game(title: "Terraria")]

    func addGame() {
        //When we make a new game we need a title for that game.
        //We need to be able to get user input for the title.
        //We need to create a new game object using that title.
        //We need to add the game to our gameArray
        print("Please enter a game title:")
        
        var newGameTitle = readLine()
        
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid title, please try again: ")
            newGameTitle = readLine()
        }
        
        
        let newGame = Game(title: newGameTitle!)
        
        
        gameArray.append(newGame)
        
        
    }
    
    func removeGame() {
        
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        
        print("Please enter the index of the game you want to remove.")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a useable index.")
            userInput = Int(readLine()!)
        }
        gameArray.remove(at: userInput!)
    }
    
    func listAvailableGames() {
        
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
            }
        }
    }
    
    func listUnavailableGames() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("This game is due on \(dateFormatter.string(from: dueDate))")
                }
            }
        }
        
    }
    
    
    
    func checkGameOut() {
        
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
            print("Please enter the index of the game you want to check out:")
            var userInput = Int(readLine()!)
            while userInput == nil {
                print("Please enter a valid index.")
                userInput = Int(readLine()!)
            }
        
            gameArray[userInput!].checkedIn = false
            
            let currentCalendar = Calendar.current
            let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
            
            gameArray[userInput!].dueDate = dueDate
        }
        

    
    func checkGameIn() {
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        print("Please enter the index of the game you want to check in:")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Please enter a valid index.")
            userInput = Int(readLine()!)
        }
        
        gameArray[userInput!].checkedIn = true
        gameArray[userInput!].dueDate = nil
        
        print("You checked in on")
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
