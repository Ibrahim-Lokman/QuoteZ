//
//  Character.swift
//  QuoteZ
//
//  Created by Ibrahim Lokman on 13/9/24.
//

import Foundation

struct Character: Codable { 
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    var death: Death?
}
