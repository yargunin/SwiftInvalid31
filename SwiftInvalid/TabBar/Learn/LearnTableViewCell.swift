//
//  LearnTableViewCell.swift
//  SwiftInvalid
//
//  Created by admin on 06.02.2023.
//

import UIKit

class LearnTableViewCell: UITableViewCell {


    
    @IBOutlet weak var menuName: UILabel!
    



       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
    

        private func commonInit() {
            let menuName = UILabel()
            addSubview(menuName)
            
            // Configure menuName constraints
            menuName.translatesAutoresizingMaskIntoConstraints = false
            menuName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
            menuName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            self.menuName = menuName
            
        }
        
        func configure(subtheme: String) {
            menuName?.text = subtheme
        }
    }
