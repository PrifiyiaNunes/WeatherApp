//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Prifiyia on 07/05/22.
//

import Foundation

struct WeatherManager {
    let weatherurl = "https://api.openweathermap.org/data/2.5/weather?appid=c71ed40294fd251971cfaf29e6bf25d8&units=metric"

    func fetchWeather(cityName: String){
        let urlString = "\(weatherurl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. create URL
        if let url = URL(string: urlString) {
            //2. create URLSession
            let session = URLSession(configuration: .default) //like a browser , which is a thing which can be use for network
            
            //3. give URLSession with a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            //4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            return //exist out of the function
        }
        if let data = data {
            let dataString = String(data: data, encoding: .utf8)
            print("dataString",dataString)
        }
    }
}
