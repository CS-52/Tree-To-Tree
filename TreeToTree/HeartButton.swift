//
//  HeartButton.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

@IBDesignable class HeartButton: UIButton {
    
    private var heartButton = UIButton()
    var interest = 0
    
    @IBInspectable var heartSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setUpButton()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
        
    }
    
    //MARK: Button Pressed
    func heartButtonTapped(button: UIButton) {
        if(interest == 0) {
            button.isSelected = false
            interest = 1
        } else {
            button.isSelected = true
            interest = 0
        }
        print("Button pressed 👍")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    private func setUpButton() {
       // button.removeFromSuperview()
        //clears existing button
        heartButton.removeFromSuperview()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
    
        let heartOutline = UIImage(named: "heartOutline", in: bundle, compatibleWith: self.traitCollection)
        let heart = UIImage(named: "heart", in: bundle, compatibleWith: self.traitCollection)
        
        
        let button = UIButton()
        // Set the button images
        button.setImage(heartOutline, for: .normal)
        button.setImage(heart, for: .selected)
        
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: heartSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: heartSize.width).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(HeartButton.heartButtonTapped(button:)), for: .touchUpInside)
        
        heartButton = button
        
        //update selected state
        
        if(interest == 0) {
            heartButton.isSelected = false
            interest = 1
        } else {
            heartButton.isSelected = true
            interest = 0
        }
    }

}
