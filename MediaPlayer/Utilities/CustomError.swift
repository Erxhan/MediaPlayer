//
//  Errors.swift
//  MediaPlayer
//
//  Created by Exrhan Selmani on 17/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import Foundation

enum CustomError: String, Error {
    case invalidSearchTerm = "The term you're searching is invalid. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connextion"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}
