//
//  TimerTableViewCell.swift
//  MultiTimer
//
//  Created by Timur on 02.07.2021.
//

import UIKit

enum buttonTextState: String {
    case pause = "Приостановить"
    case resume = "Продолжить"
}

class TimerTableViewCell: UITableViewCell {
    
    typealias bts = buttonTextState
    static let identifier = "timerCell"
    weak var delegate: MultiTimersTableViewProtocol?
    fileprivate var timerModel: TimerModel?
    
    let button = { buttonInit(title: bts.pause.rawValue) }()
    
    func update(for model: TimerModel) {
        timerModel = model
        textLabel?.text = model.name
        getTimeFrom(seconds: model.amount) { (time) in
            self.detailTextLabel?.text = time
        }
        button.setTitle(model.paused ? bts.resume.rawValue : bts.pause.rawValue, for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    @objc func buttonTapped() {
        guard let timerModel = timerModel else { return }
        delegate?.updateTimer(for: timerModel)
    }
}
