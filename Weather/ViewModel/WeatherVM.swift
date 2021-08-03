//
//  WeatherVM.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

class WeatherVM: ObservableObject {
    
    @Published var cityWeather = WeatherModel(name: "Loading data", country: "...", timezone: 0, conditionID: 0, temp: 0, weatherDescription: ".Loading data...", sunrise: 0, sunset: 0, windSpeed: 0, humidity: 0, clouds: 0)
    
    @Published var searchBarData = [String]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(searchBarData) {
                UserDefaults.standard.set(encoded, forKey: "Search Bar Data")
            }
        }
    }
    
    @Published var location = GetLocation()
    @Published var infoAPI = NetworkManager()
    
    @Published var isShowingWeatherView = false
    @Published var isShowingLoadingView = false
    @Published var isShowingErrorAlert = false
    
    init() {
        
        if let searchBarData = UserDefaults.standard.data(forKey: "Search Bar Data") {
            if let decoded = try? JSONDecoder().decode([String].self, from: searchBarData) {
                self.searchBarData = decoded
                return
            }
        }
        self.searchBarData = []
    }
    
    func getAPIURL(cityName: String) -> String {
        
        let apiString = infoAPI.cityURL()
        let normalizedCityName = cityName.folding(options: .diacriticInsensitive, locale: .current).lowercased()
        let urlCityName = normalizedCityName.trimmingCharacters(in: .whitespaces).split(separator: " ")
        return apiString + "&q=\(urlCityName.joined(separator: "%20"))"
    }
    
    func fetchData(url: String) {
        
            self.isShowingLoadingView = true
            
            if let urlString = URL(string: url) {
                let task = URLSession(configuration: .default).dataTask(with: urlString) { data, response, error in
                    if error != nil {
                        return
                    }
                    
                    if let safeData = data {
                        do {
                            let r = try JSONDecoder().decode(APIData.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.cityWeather = WeatherModel(name: r.name, country: r.sys.country, timezone: Double(r.timezone), conditionID: r.weather[0].id, temp: r.main.temp, weatherDescription: r.weather[0].description, sunrise: r.sys.sunrise, sunset: r.sys.sunset, windSpeed: r.wind.speed, humidity: r.main.humidity, clouds: r.clouds.all)
                                
                                self.updateSearchBarData(result: self.cityWeather)
                                self.isShowingWeatherView = true
                                return
                            }
                        } catch {
                            self.showErrorAlert()
                        }
                        DispatchQueue.main.async {
                            self.isShowingLoadingView = false
                        }
                    }
                }
                task.resume()
        }
    }
    
    func fetchLocalWeather(current: WeatherVM) {
        do {
            if let currentLocation = current.location.lastLocation {
                let url = infoAPI.currentLocationURL(latitude: currentLocation.latitude, longitude: currentLocation.longitude) 
                current.fetchData(url: url)
                return
                
            } else {
                self.showErrorAlert()
            }
        }
    }
    
    func updateSearchBarData(result: WeatherModel) {
        
        if !searchBarData.contains(result.name) {
            searchBarData.insert(result.name, at: 0)
            
            if searchBarData.count >= 10 {
                searchBarData.removeLast()
            }
        }
    }
    
    func showErrorAlert() {
        DispatchQueue.main.async {
            self.isShowingErrorAlert = true
            self.isShowingLoadingView = false
        }
    }
}
