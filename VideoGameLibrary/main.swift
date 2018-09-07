//
//  main.swift
//  VideoGameLibrary
//
//  Created by Zach Shearer on 8/30/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation

var userInput: String?
var ageSet = false
var age = 0

print("Welcome to the Video Game Library")

print("Please enter your Age:")


repeat {
    userInput = readLine()
    guard let ageNumber = Int(userInput!) else {
        print("Please enter a valid age.")
        continue
    }
    age = ageNumber
    ageSet = true
} while ageSet == false

print("Age has been set to \(age)")


let menu = Menu()
menu.go()

