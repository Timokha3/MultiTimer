//
//  MultiTimersViewModel.swift
//  MultiTimer
//
//  Created by Timur on 02.07.2021.
//

import Foundation

class MultiTimersViewModel: MultiTimersTableViewProtocol {
    
    var timer: Timer?
    var sections: [String] {
        return ["Добавление таймеров", "Таймеры"]
    }
    
    var timers: Box<[TimerModel]> = Box([])
    
    func numberOfSection() -> Int {
        return sections.count
    }
    
    func getSectionName(for section: Int) -> String {
        return sections[section]
    }
    
    func numberOfRowsInSection(for section: Int) -> Int {
        return section == 0 ? 1 : timers.value.count
    }
    
    func addNewTimer(for name: String, seconds: Int) {
        if !timers.value.contains(where: { $0.name == name })  {
            timers.value.append(TimerModel(name: name, paused: false, amount: seconds))
        }
    }
    
    func updateTimer(for timerModel: TimerModel) {
        self.timers.value = self.timers.value.map { TimerModel(name: $0.name, paused: $0.name == timerModel.name ? !timerModel.paused : $0.paused, amount: $0.amount)}
    }
    
    init() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        DispatchQueue.global(qos: .background).async {
            self.timers.value = self.timers.value.filter{ $0.amount > 0 }.map { TimerModel(name: $0.name, paused: $0.paused, amount: $0.paused ? $0.amount : $0.amount - 1) }.sorted { $0.amount > $1.amount}
        }
    }
    
}
