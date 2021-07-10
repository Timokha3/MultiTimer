//
//  TextField.swift
//  MultiTimer
//
//  Created by Timur on 09.07.2021.
//

import UIKit

func textFieldInit(placeholder: String = "") -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeholder
    textField.borderStyle = .roundedRect
    return textField
}
