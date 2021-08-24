//
//  NetworkingManager.swift
//  CryptoTrackerSwiftUI
//
//  Created by Juan Reyes on 8/24/21.
//

import Foundation
import Combine

class NetworkingManager {
    
    // Because we have "static", we don't have to initialize the class every time
    static func download(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data

            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
