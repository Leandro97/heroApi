//
//  ViewController.swift
//  ui
//
//  Created by Leandro Martins on 26/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var spinner:            UIView?
    var headerView:         UIView?
    var eyeColorPicker:     CustomPickerView?
    var hairTypePicker:     CustomPickerView?
    var intelligencePicker: CustomPickerView?
    var strengthPicker:     CustomPickerView?
    var speedPicker:        CustomPickerView?
    var powerPicker:        CustomPickerView?
    var combatPicker:       CustomPickerView?
    var submitButton:       UIButton?
    
    var pickerList = [CustomPickerView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHeaderView()
        configureEyeColorPickerView()
        configureHairTypePicker()
        configureIntelligencePicker()
        configureStrengthPicker()
        configureSpeedPicker()
        configurePowerPicker()
        configureCombatPicker()
        configureSubmitButton()
    }
    
    func configureHeaderView() {
        headerView                 = UIView()
        guard let headerView       = headerView else { return }
        headerView.backgroundColor = UIColor.init(red: 8/255, green: 128/255, blue: 171/255, alpha: 1)
        
        self.view.addSubview(headerView)
        headerView.anchor(top:      self.view.topAnchor,
                          leading:  self.view.leadingAnchor,
                          trailing: self.view.trailingAnchor,
                          padding:  UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                          size:     CGSize(width: 0, height: 80))
        
        setTitleLabel()
        setIcon()
    }
    
    func setTitleLabel() {
        let label            = UILabel()
        guard let headerView = headerView else { return }
        label.textAlignment  = .left
        label.textColor      = .white
        label.text           = "Am I a hero?"
        label.font           = UIFont(name: "AvenirNextCondensed-Heavy", size: 36)
        
        headerView.addSubview(label)
        label.anchor(top:     headerView.topAnchor,
                     leading: headerView.leadingAnchor,
                     bottom:  headerView.bottomAnchor,
                     padding: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }
    
    func setIcon() {
        let imageView         = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        guard let headerView  = headerView else { return }
        imageView.image       = UIImage(named: "hero")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor   = .white
        imageView.contentMode = .scaleToFill
        
        headerView.addSubview(imageView)
        imageView.anchor(top:      headerView.topAnchor,
                         trailing: headerView.trailingAnchor,
                         padding:  UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 10))
        
    }
    
    func configureEyeColorPickerView() {
        eyeColorPicker           = CustomPickerView()
        guard let eyeColorPicker = eyeColorPicker else { return }
        
        eyeColorPicker.setChoices(textPlaceHolder: "Eye Color",
                                  choicesList:     ["Blue", "Brown", "Green", "Other"])
        
        self.view.addSubview(eyeColorPicker)
        eyeColorPicker.anchor(top:      headerView?.bottomAnchor,
                              leading:  self.view.leadingAnchor,
                              trailing: self.view.trailingAnchor,
                              padding:  UIEdgeInsets(top: 15, left: 16, bottom: 0, right: 16),
                              size:     CGSize(width: 0, height: 40))
        pickerList.append(eyeColorPicker)
    }
    
    func configureHairTypePicker() {
        hairTypePicker           = CustomPickerView()
        guard let hairTypePicker = hairTypePicker else { return }
        
        hairTypePicker.setChoices(textPlaceHolder: "Hair Type",
                                  choicesList:     ["Black", "Blond", "Brown", "Other"])
        
        self.view.addSubview(hairTypePicker)
        hairTypePicker.anchor(top:      eyeColorPicker?.bottomAnchor,
                              leading:  self.view.leadingAnchor,
                              trailing: self.view.trailingAnchor,
                              padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
                              size:     CGSize(width: 0, height: 40))
        pickerList.append(hairTypePicker)
    }
    
    func configureIntelligencePicker() {
        intelligencePicker           = CustomPickerView()
        guard let intelligencePicker = intelligencePicker else { return }
        
        intelligencePicker.setChoices(textPlaceHolder: "Intelligence level",
                                      choicesList:     ["Very Dumb", "Dumb", "Normal", "Intelligent", "Super Intelligent"])
        
        self.view.addSubview(intelligencePicker)
        intelligencePicker.anchor(top:      hairTypePicker?.bottomAnchor,
                                  leading:  self.view.leadingAnchor,
                                  trailing: self.view.trailingAnchor,
                                  padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
                                  size:     CGSize(width: 0, height: 40))
        pickerList.append(intelligencePicker)
    }
    
    func configureStrengthPicker() {
        strengthPicker           = CustomPickerView()
        guard let strengthPicker = strengthPicker else { return }
        
        strengthPicker.setChoices(textPlaceHolder: "Strength level",
                                  choicesList:     ["Very Weak", "Weak", "Normal", "Strong", "Super Strong"])
        
        self.view.addSubview(strengthPicker)
        strengthPicker.anchor(top:      intelligencePicker?.bottomAnchor,
                              leading:  self.view.leadingAnchor,
                              trailing: self.view.trailingAnchor,
                              padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
                              size:     CGSize(width: 0, height: 40))
        pickerList.append(strengthPicker)
    }
    
    func configureSpeedPicker() {
        speedPicker           = CustomPickerView()
        guard let speedPicker = speedPicker else { return }
        
        speedPicker.setChoices(textPlaceHolder: "Speed level",
                               choicesList:     ["Very Slow", "Slow", "Normal", "Fast", "Super Fast"])
        
        self.view.addSubview(speedPicker)
        speedPicker.anchor(top:      strengthPicker?.bottomAnchor,
                           leading:  self.view.leadingAnchor,
                           trailing: self.view.trailingAnchor,
                           padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
                           size:     CGSize(width: 0, height: 40))
        pickerList.append(speedPicker)
    }
    
    func configurePowerPicker() {
        powerPicker           = CustomPickerView()
        guard let powerPicker = powerPicker else { return }
        
        powerPicker.setChoices(textPlaceHolder: "Power level",
                               choicesList:     ["Very Weak", "Weak", "Normal", "Powerful", "Super Powerful"])
        
        self.view.addSubview(powerPicker)
        powerPicker.anchor(top:      speedPicker?.bottomAnchor,
                           leading:  self.view.leadingAnchor,
                           trailing: self.view.trailingAnchor,
                           padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
                           size:     CGSize(width: 0, height: 40))
        pickerList.append(powerPicker)
    }
    
    func configureCombatPicker() {
        combatPicker           = CustomPickerView()
        guard let combatPicker = combatPicker else { return }
        
        combatPicker.setChoices(textPlaceHolder: "Combat level",
                                choicesList:     ["Very Bad", "Bad", "Good", "Very Good", "Excellent"])
        
        self.view.addSubview(combatPicker)
        combatPicker.anchor(top:      powerPicker?.bottomAnchor,
                            leading:  self.view.leadingAnchor,
                            trailing: self.view.trailingAnchor,
                            padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
                            size:     CGSize(width: 0, height: 40))
        pickerList.append(combatPicker)
    }
    func configureSubmitButton() {
        submitButton                    = UIButton()
        guard let submitButton          = submitButton else { return }
        submitButton.layer.cornerRadius = 3
        submitButton.backgroundColor    = UIColor.init(red: 135/255, green: 206/255, blue: 104/255, alpha: 1)
        submitButton.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 18)
        submitButton.setTitle("SUBMIT", for: .normal)
        
        self.view.addSubview(submitButton)
        submitButton.anchor(leading:  self.view.leadingAnchor,
                            bottom:   self.view.bottomAnchor,
                            trailing: self.view.trailingAnchor,
                            padding:  UIEdgeInsets(top: 0, left: 16, bottom: 20, right: 16),
                            size:     CGSize(width: 0, height: 56))
        
        submitButton.addTarget(self, action: #selector(submitRequest), for: .touchUpInside)
    }
    
    @objc func submitRequest() {
        var allFieldsAreFileld = true
        
        for picker in pickerList {
            if picker.textField.text == "" {
                allFieldsAreFileld = false
                break
            }
        }
        
        if !allFieldsAreFileld {
            self.showAlert(title: "Invalid answers!", message: "All fields must be filled!")
            return
        }
        
        let json = ["eyeColor":     String(pickerList[0].choiceIndex),
                    "hairType":     String(pickerList[1].choiceIndex),
                    "intelligence": String(pickerList[2].choiceIndex),
                    "strength":     String(pickerList[3].choiceIndex),
                    "speed":        String(pickerList[4].choiceIndex),
                    "power":        String(pickerList[5].choiceIndex),
                    "combat":       String(pickerList[6].choiceIndex)]
        
        showSpinner(onView: self.view)
        RequestHandler.performRequest(json: json) { (data, response, error) in
            let responseJson = try? JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String : String]
            let role         = responseJson?["message"] ?? ""
            
            if role == "" {
                self.submitRequest()
                return
            }
            
            self.removeSpinner()
            self.showAlert(title: "You are...", message: "a " + role + "!")
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:   title,
                                          message: message, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
        }
    }
}

extension ViewController {
    func showSpinner(onView : UIView) {
        if let _ = spinner { return }
        
        let spinnerView             = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView.init(style: .medium)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        spinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.spinner?.removeFromSuperview()
            self.spinner = nil
        }
    }
}
