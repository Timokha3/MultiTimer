//
//  Button.swift
//  MultiTimer
//
//  Created by Timur on 09.07.2021.
//

import UIKit

func buttonInit(title: String) -> UIButton {
    let button = UIButton(type: .roundedRect)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    return button
}
