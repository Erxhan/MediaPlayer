//
//  NetworkManager.swift
//  MediaPlayer
//
//  Created by Exrhan Selmani on 17/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://itunes.apple.com/search"
    
    typealias GetTrackResult = (Result<[Track], CustomError>) -> Void
    
    func getTracks(searchTerm: String, completion: @escaping GetTrackResult) {
        guard var urlComponents = URLComponents(string: baseURL) else { return }
        urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponents.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                print(data)
                let tracksResult = try decoder.decode(TracksResult.self, from: data)
                print(tracksResult.resultCount)
                completion(.success(tracksResult.tracks))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
