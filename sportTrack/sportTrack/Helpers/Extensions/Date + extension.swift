//
//  Date + extension.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import Foundation

extension Date{
    static var calendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        return Calendar.current
    }()
    
    var startOfWeek: Date{
        let components = Date.calendar.dateComponents([.yearForWeekOfYear,.weekOfYear], from: self)
        guard let firstDay = Date.calendar.date(from: components) else { return self }
        return Date.calendar.date(byAdding: .day, value: 0, to: firstDay) ?? self
    }
    
    func goForward(to days: Int) -> Date{
        return Date.calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    func stripTime() -> Date{
        let components = Date.calendar.dateComponents([.year, .month, .day], from: self)
        return Date.calendar.date(from: components) ?? self
    }
}
