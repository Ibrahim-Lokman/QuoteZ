//
//  FetchService.swift
//  QuoteZ
//
//  Created by Ibrahim Lokman on 16/9/24.
//

import Foundation


struct FetchService {
    enum FetchError: Error {
        case badResponse
    }
    let baseURL = URL(string:"https://breaking-bad-api-six.vercel.app/api")!
    func fetchQuote(from show: String) async throws -> Quote {
        //enpoint
        let quoteURL = baseURL.appending(path: "quotes/random")
        //fetch url
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(
        name: "production", value: show
        )])
        // data fetching
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        //response handling
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        // data decoding
        let quote = try JSONDecoder().decode(Quote.self, from:data)
        
        //return
        return quote
        
    }
    
    func fetchCharacter(_ name: String) async throws -> Character {
        //enpoint
        let characterURL = baseURL.appending(path: "characters")
        //fetch url
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(
        name: "name", value: name
        )])
        // data fetching
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        //response handling
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        // data decoding
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Character].self, from: data)
        //return
        return characters[0]
        
    }
    
    func fetchDeath(for character: String) async throws -> Death? {
        //enpoint and fetch url
        let fetchURL = baseURL.appending(path: "deaths")
        
        // data fetching
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        //response handling
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        // data decoding
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        
        
        
        //return
        return nil
        
    }
}
