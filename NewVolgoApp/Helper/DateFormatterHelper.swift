//
//  DateFormatterHelper.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 15/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import Foundation

class DateFormatterHelper {
    static func dateFormatterToString(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, d MMM yyyy"
        return df.string(from: date)
    }
}
