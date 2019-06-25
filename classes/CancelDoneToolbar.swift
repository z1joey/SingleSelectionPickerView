//
//  CustomToolbar.swift
//  Companion
//
//  Created by Joey Zhang on 6/25/19.
//  Copyright © 2019 TGI. All rights reserved.
//

import UIKit

class CancelDoneToolbar: UIToolbar {

    var doneButtonTappedHandler: (() -> ())? = nil
    var cancelButtonTappedHandler: (() -> ())? = nil
    
    required convenience init(style: UIBarStyle = .default) {
        self.init()
        
        self.barStyle = style
        self.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        doneButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(red: 246/255, green: 90/255, blue: 92/255, alpha: 1)], for: .normal)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        cancelButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 1)], for: .normal)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        self.setItems([cancelButton, spaceButton, doneButton], animated: false)
        self.isUserInteractionEnabled = true
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneButtonTapped() {
        if let handler = doneButtonTappedHandler {
            handler()
        }
    }
    
    @objc func cancelButtonTapped() {
        if let handler = cancelButtonTappedHandler {
            handler()
        }
    }
    
}
