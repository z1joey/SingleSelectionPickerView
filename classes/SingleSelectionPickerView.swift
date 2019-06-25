//
//  CustomPickerView.swift
//  Companion
//
//  Created by Joey Zhang on 6/25/19.
//  Copyright © 2019 TGI. All rights reserved.
//

import UIKit

class SingleSelectionPickerView: UIPickerView {

    var titles = [String]()
    
    var font = UIFont.systemFont(ofSize: 20)
    
    required convenience init(titles: [String], backgroundColor: UIColor = .white) {
        self.init()
        self.titles = titles
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = backgroundColor
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: - Delegate & Datasource
extension SingleSelectionPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let highlightColor = UIColor(red: 246/255, green: 90/255, blue: 92/255, alpha: 1)
        
        if let label = pickerView.view(forRow: row, forComponent: component) as? UILabel {
            label.textColor = .white
            label.backgroundColor = highlightColor
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 68
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let rowSize = pickerView.rowSize(forComponent: component)

        let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: rowSize))
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = font
        label.text = titles[row]

        return label

    }
    
}
