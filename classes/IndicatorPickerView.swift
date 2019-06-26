//
//  ToolbarPickerView.swift
//  iOSTest
//
//  Created by Joey Zhang on 6/26/19.
//  Copyright © 2019 TGI Technology. All rights reserved.
//

import UIKit

// MARK: - Properties
open class IndicatorPickerView: UIView {

    fileprivate var pickerView: UIPickerView!
    fileprivate var indicator: UIView!
    
    public var titles = [String]()
    public var font = UIFont.systemFont(ofSize: 16)
    public var indicatorColor = UIColor(red: 246/255, green: 90/255, blue: 92/255, alpha: 1)
    public var rowHeight: CGFloat = 68
    public var selectedValue: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupIndicator()
        setupPickerView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Helper methods
fileprivate extension IndicatorPickerView {
    
    func setupPickerView() {
        pickerView = UIPickerView(frame: frame)
        pickerView.backgroundColor = .clear
        pickerView.dataSource = self
        pickerView.delegate = self
        addSubview(pickerView)
    }
    
    func setupIndicator() {
        let height = frame.height / 3
        indicator = UIView(frame: CGRect(x: 0, y: height, width: frame.width, height: height))
        indicator.backgroundColor = indicatorColor
        addSubview(indicator)
    }
    
}


// MARK: - Delegate & Datasource
extension IndicatorPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    final public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    final public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // Hide indicator lines
        for view in pickerView.subviews {
            if view.frame.height < 5 {
                view.backgroundColor = .clear
            }
        }
        
        // Set up font for rows
        let selectedRow = pickerView.selectedRow(inComponent: component)
        let selectedFont = NSAttributedString(string: titles[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        let defaultFont = NSAttributedString(string: titles[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 75/255)])
     
        return (row == selectedRow) ? selectedFont : defaultFont
    }
    
    final public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = titles[row]
        pickerView.reloadComponent(component)
    }
    
   final public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    
}

