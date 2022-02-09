//
//  CustomTextField.swift
//  TestProject
//
//  Created by Antonella Brini Vago on 28/01/2022.
//

import UIKit

@IBDesignable
class UnderlinedtextField: UITextField {
    
    var underline = CALayer()
    
    func setupUnderline() {
        
        borderStyle = .none
        
        let lineWidth: CGFloat = 1.0
        underline.borderColor =  UIColor.darkGray.cgColor
        underline.frame = CGRect(
            x: 0,
            y: frame.size.height - lineWidth,
            width: frame.size.width,
            height: frame.size.height
        )
        underline.borderWidth = lineWidth
        
        layer.addSublayer(underline)
        layer.masksToBounds = true
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        setupUnderline()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 35.0)
    }
    
    private func addPadding() {
        
        rightViewMode = .always
        leftViewMode = .always
        
        let paddingView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 12,
                height: 35
            )
        )
        
        leftView = paddingView
        rightView = paddingView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addPadding()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addPadding()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addPadding()
        setupUnderline()
        
    }
    
}


