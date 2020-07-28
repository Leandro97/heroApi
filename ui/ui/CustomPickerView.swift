//
//  CustomPickerView.swift
//  ui
//
//  Created by Leandro Martins on 26/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

public class CustomPickerView: UIView {
    var fieldName = UILabel()
    var textField = UITextField()
    var dropDown  = UIPickerView()
    let toolBar   = UIToolbar()
    
    var choicesList = [String]()
    var choiceIndex = 0
    
    func setChoices(textPlaceHolder: String, choicesList: [String]) {
        self.choicesList = choicesList
        
        configureTextField(textPlaceHolder: textPlaceHolder)
        configureToolBar()
        configureDropDown()
    }
    
    func configureTextField(textPlaceHolder: String) {
        textField.inputView          = dropDown
        textField.inputAccessoryView = toolBar
        textField.placeholder        = textPlaceHolder
        textField.textAlignment      = .center
        textField.delegate           = self
        
        self.addSubview(textField)
        textField.fillSuperView()
    }
    
    func configureToolBar() {
        toolBar.barStyle      = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor     = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)

        let doneButton = UIBarButtonItem(title:  "Done",
                                         style:  UIBarButtonItem.Style.done,
                                         target: self,
                                         action: #selector(self.donePicker))

        toolBar.setItems([flexibleSpace, doneButton, flexibleSpace], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    func configureDropDown() {
        dropDown.delegate   = self
        dropDown.dataSource = self
    }
    
    @objc func donePicker() {
        self.endEditing(true)
        choiceIndex = dropDown.selectedRow(inComponent: 0)
    }
}

extension CustomPickerView: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choicesList.count
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choicesList[row]
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = choicesList[row]
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text != "" { return  }
        textField.text          = choicesList[0]
        fieldName.text          = textField.placeholder
        fieldName.textColor     = .gray
        fieldName.font          = .systemFont(ofSize: 12, weight: .light)
        fieldName.textAlignment = .center
        
        self.addSubview(fieldName)
        fieldName.anchor(leading:  self.leadingAnchor,
                         bottom:   textField.topAnchor,
                         trailing: self.trailingAnchor)
    }
}
