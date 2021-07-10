//
//  DateTime.swift
//  MultiTimer
//
//  Created by Timur on 09.07.2021.
//

import Foundation

func getTimeFrom(seconds: Int, completion: @escaping (String)->()) {
    
    let hh = String(format: "%02d", seconds / 3600)
    let mm = String(format: "%02d", (seconds % 3600) / 60)
    let ss = String(format: "%02d", (seconds % 3600) % 60)
    
    completion("\(hh):\(mm):\(ss)".replacingOccurrences(of: "00:", with: ""))
}
