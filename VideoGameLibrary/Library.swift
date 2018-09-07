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
        
        print("You must be an admin to add or remove a game.\nEnter the password:")
        let adminPass = String(readLine()!)
        
        if adminPass == "thisisthepassword" {
            
        } else {
            print("Incorrect password")
            return
        }
        
        print("Please enter a game title:")
        
        var newGameTitle = readLine()
        
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid title, please try again: ")
            newGameTitle = readLine()
        }
        
        let newGame = Game(title: newGameTitle!)
        
        gameArray.append(newGame)
        
        
    }
    
    func getAvailableGames() -> [Game] {
        var availableGames = [Game]()
        
        for game in gameArray {
            if game.checkedIn {
                availableGames.append(game)
            }
        }
        
        return availableGames
    }
    
    func getUnavailableGames() -> [Game] {
        var availableGames = [Game]()
        
        for game in gameArray {
            if !game.checkedIn {
                availableGames.append(game)
            }
        }
        
        return availableGames
    }
    
    
    
    
    func removeGame() {
        
        print("You must be an admin to add or remove a game.\nEnter the password:")
        let adminPass = String(readLine()!)
        
        if adminPass == "thisisthepassword" {
            
        } else {
            print("Incorrect password")
            return
        }
        
        let availableGames = getAvailableGames()
        
        for (index, game) in availableGames.enumerated() {
            print("\(index). \(game.title)")
        }
        
        print("Please enter the index of the game you want to remove.")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a useable index.")
            userInput = Int(readLine()!)
        }
        
        if availableGames.count < userInput! || userInput! <= -1 {
            print("You must enter a valid index.")
            userInput = Int(readLine()!)
        } else {
            gameArray.remove(at: userInput!)
        }
        
        
        
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
                    print("This game is due on \(dateFormatter.string(from: dueDate))\n")
                }
            }
        }
        
    }
    
    
    
    func checkGameOut() {
        let availableGames = getAvailableGames()
        
        for (index, game) in availableGames.enumerated(){
            print("\(index). \(game.title)")
        }
        print("Please enter the index of the game you want to check out:")
        
        
        var index: Int? = nil
        
        repeat {
            
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid input. Please enter a valid index.")
                userInput = Int(readLine()!)
            }
            if userInput! >= 0 && userInput! < availableGames.count {
                index = userInput!
            } else {
                print("Invalid input. Please enter a valid index.")
            }
        } while index == nil
        
        let currentCalendar = Calendar.current
        let twoWeek = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        
        availableGames[index!].checkedIn = false
        availableGames[index!].dueDate = twoWeek
        
        print("\(availableGames[index!].title) is due back on \(dateFormatter.string(from: twoWeek!))")
        
    }
    
    
    
    
    
    
    
    func checkGameIn() {
        
        var gameName = ""
        let unavailableGames = getUnavailableGames()
        if unavailableGames.count <= 0 {
            print("You have not checked out a game.")
            return
        }
        
        
        for (index, game) in unavailableGames.enumerated() {
            if !game.checkedIn {
                print("\(index). \(game.title)")
                gameName = game.title
            }
        }
        print("Please enter the index of the game you want to check in:")
        var userInput: Int? = nil
        
        let dueDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        repeat {
            userInput = Int(readLine()!)
            if unavailableGames.count <= userInput! || userInput! <= -1 {
                print("Please enter a correct index.")
                userInput = nil
            } else {
                unavailableGames[userInput!].checkedIn = true
                unavailableGames[userInput!].dueDate = nil
                print("You checked in \(gameName) on \(dateFormatter.string(from: dueDate))")
            }
        }while userInput == nil
    }
    
}
