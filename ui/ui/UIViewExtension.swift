//
//  UIViewExtension.swift
//  ui
//
//  Created by Leandro Martins on 26/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

extension UIView {
    @available(iOS 9.0, *)
    func anchor(top:      NSLayoutYAxisAnchor? = nil,
                leading:  NSLayoutXAxisAnchor? = nil,
                bottom:   NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding:  UIEdgeInsets         = .zero,
                size:     CGSize               = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView() {
        if #available(iOS 9.0, *) {
            anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
        }
    }
}
