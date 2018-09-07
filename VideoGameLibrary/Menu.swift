//
//  Menu.swift
//  VideoGameLibrary
//
//  Created by Zach Shearer on 8/30/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation

    var shouldQuit = false
    let library = Library()

class Menu {
    
    func go() {
        repeat {
            print("""
        \n
        Menu
        1. Add Game to Library(Admins Only)
        2. Remove Game from Library(Admins Only)
        3. List Available Games
        4. List of Unavailable Games
        5. Check Game In
        6. Check Game Out
        7. Help
        8. Quit
        """)
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid Input")
                input = getInput()
            }
            
            handleInput(input)
            
        }  while !shouldQuit
    }


    func quit() {
        shouldQuit = true
        print("Thanks for using the Video Game Library!")
    }

func help() {
    print("""
        \n
        Menu
        1. Add Game to Library(Admins Only)
        2. Remove Game from Library(Admins Only)
        3. List Available Games
        4. List of Unavailable Games
        5. Check Game In
        6. Check Game Out
        7. Help
        8. Quit
        """)
}


func handleInput(_ input: String) {
    switch input {
    case "1":
        library.addGame()
    case "2":
        library.removeGame()
    case "3":
        library.listAvailableGames()
    case "4":
        library.listUnavailableGames()
    case "5":
        library.checkGameIn()
    case "6":
        library.checkGameOut()
    case "7":
        help()
    case "8":
        quit()
    default:
        break
    }

}




func validateInput(_ input: String) -> Bool {
    let menuOptions = Array(1...8)
    
    guard let number = Int(input) else { return false }
        return menuOptions.contains(number)
}



func getInput() -> String {
    var input: String? = nil
    
    repeat {
        let line = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != "" {
            input = line
        } else {
            print("Invalid Input")
        }
    } while input == nil
    
    return input!
}
}
