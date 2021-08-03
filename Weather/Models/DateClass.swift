//
//  DateInfo.swift
//  Weather
//
//  Created by Diego Llopis on 20/07/21.
//

import Foundation

class DateClass  {
    
    static func getCurrentDate(timezone: Double) -> Date {
        
        var UTCDate = Date()
        UTCDate.addTimeInterval(timezone)
        return UTCDate
    }
    
    static func getDateDetailsString(string: String, timezone: Double) -> String {
        
        let UTCDate = getCurrentDate(timezone: timezone)
        let formatter = DateFormatter()
        formatter.dateFormat = string
        formatter.timeZone = TimeZone(identifier:"GMT")
        return formatter.string(from: UTCDate)
    }
    
    static func getSunTime(sunTime: Int, timezone: Double) -> Date {
        
        let epochTime = TimeInterval(sunTime)
        var sunTime = Date(timeIntervalSince1970: epochTime)
        sunTime.addTimeInterval(timezone)
        return sunTime
    }
    
}
