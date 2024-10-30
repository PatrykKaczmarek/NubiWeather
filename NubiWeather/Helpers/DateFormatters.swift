//
//  DateFormatters.swift
//  NubiWeather
//
//  Created by Michał Gałęziowski on 30/10/2024.
//

import Foundation

struct DateFormatters {
    static let simpleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        return formatter
    }()
    
    static let dayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}
