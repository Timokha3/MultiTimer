//
//  MultiTimersTableViewProtocol.swift
//  MultiTimer
//
//  Created by Timur on 02.07.2021.
//

import Foundation

protocol MultiTimersTableViewProtocol: class {
    var sections: [String] { get }
    var timers: Box<[TimerModel]> { get set }
    
    func numberOfSection() -> Int
    func getSectionName(for section: Int) -> String
    func numberOfRowsInSection(for section: Int) -> Int
    
    func addNewTimer(for name: String, seconds: Int)
    func updateTimer(for timerModel: TimerModel)
}
