//
//  Date+Extensions.swift
//  TNWallpaper
//
//  Created by Rezaul Karim on 21/4/25.
//  Copyright © 2025 Technonext. All rights reserved.
//

import Foundation

extension Date{
    
    func getTimeInString(format:String = "yyyy/MM/dd HH:mm") -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let locale = Locale(identifier: "en_US")
        dateFormatter.locale = locale
        dateFormatter.timeZone = TimeZone.current
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func getCurrentTimestamp() -> TimeInterval {
        return TimeInterval(Date().getTimestampValue())
    }
    
    func getTimestampValue() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func getCurrentTimestampInSeconds() -> TimeInterval {
        return TimeInterval(Date().getTimestampValueInSeconds())
    }

    func getTimestampValueInSeconds() -> Int64! {
        return Int64(self.timeIntervalSince1970)
    }
    
    func timeAgoDisplay(exactSecondsShow : Bool = true) -> String {
        
        let calendar = Calendar.current
        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        
        if minuteAgo < self {
            if exactSecondsShow == false{
                return "a few sec ago"
            }else{
                let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
                return "\(diff)s ago"
            }

        } else if hourAgo < self {
            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
            return "\(diff)m ago"
        } else if dayAgo < self {
            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
            return "\(diff)h ago"
        } else if weekAgo < self {
            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
            return "\(diff)d ago"
        }
        let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
        
        return "\(diff)w ago"
        
    }
}
