//
//  Date+9Hour.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import Foundation

extension Date {

    func toStringWithCurrentLocale() -> String {

        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return formatter.string(from: self)
    }
}
