//
//  Weather.swift
//  TakeHomeProjectSPD
//
//  Created by Mondale on 6/3/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    var main: String
    var description: String
    var icon: String
}


struct Weather: Codable {
    var weather: [WeatherData]
}
