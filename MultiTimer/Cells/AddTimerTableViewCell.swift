//
//  AddTimerTableViewCell.swift
//  MultiTimer
//
//  Created by Timur on 02.07.2021.
//

import UIKit

class AddTimerTableViewCell: UITableViewCell {
    
    static let identifier = "timerAddCell"
    weak var delegate: MultiTimersTableViewProtocol?
    
    let button: UIButton = { buttonInit(title: "Добавить") }()
    let timerNameTF: UITextField = { textFieldInit(placeholder: "Название таймера") }()
    let timeInSecondTF: UITextField = { textFieldInit(placeholder: "Время в секундах") }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        // timer name
        self.contentView.addSubview(timerNameTF)
        timerNameTF.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        timerNameTF.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        timerNameTF.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        
        // timeInSecund
        self.contentView.addSubview(timeInSecondTF)
        timeInSecondTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        timeInSecondTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        timeInSecondTF.topAnchor.constraint(equalTo: timerNameTF.bottomAnchor, constant: 5).isActive = true
        
        // button
        self.contentView.addSubview(button)
        button.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5).isActive = true
        button.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 100).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        guard let name = self.timerNameTF.text,
              let amount = self.timeInSecondTF.text, !name.isEmpty, !amount.isEmpty else { return }
        delegate?.addNewTimer(for: name, seconds: Int(amount)!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
    }

}
