//
//  NetworkManager.swift
//  TakeHomeProjectSPD
//
//  Created by Mondale on 6/3/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class NetworkManager {
    
    // Creates  Singleton
    static let shared = NetworkManager()
    private init(){}
    
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=San%20Francisco&appid=f885ab78fd098417a205af6a335c80b9"
    
    func getWeather(completed: @escaping(Result<Weather, ErrorMessage>) ->Void){
        
        // Returns if URL is invalid
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Returns if error exists
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Returns if response is not successful status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Returns if data is invalid
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            // Trys to decode data, throws failure if invalid
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Weather.self, from: data)
                print(response)
                
                
//                completed(.success(weather))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
}
