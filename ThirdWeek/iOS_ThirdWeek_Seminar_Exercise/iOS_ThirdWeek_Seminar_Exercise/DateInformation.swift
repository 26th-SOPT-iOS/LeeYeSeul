//
//  DateInformation.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 이예슬 on 5/9/20.
//  Copyright © 2020 이예슬. All rights reserved.
//
struct DateInformation {
    var weather: Weather
    var date: String
    var subTitle: String
    init(weather: Weather, date: String, subTitle: String) {
        self.weather = weather
        self.date = date
        self.subTitle = subTitle
    }
}
enum Weather {
    case cloudy
    case rainny
    case snowy
    case sunny
    func getImageName() -> String { switch self {
case .cloudy: return "weather-cloudy" case .rainny: return "weather-rainny" case .snowy: return "weather-snowy" case .sunny: return "weather-sunny" }
} }
