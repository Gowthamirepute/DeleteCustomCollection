//
//  CustomCollectionViewCell.swift
//  DeleteCustomCollection
//
//  Created by Hxtreme on 11/03/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func btnAction(_ sender: Any) {
        
    }

//    override var isHighlighted: Bool {
//        didSet {
//            btn.tintColor = isHighlighted ? UIColor.white : UIColor.blue
//        }
//    }
    
    override var isSelected: Bool {

        didSet {
            print("sss")
            btn.tintColor = isSelected ? UIColor.orange : UIColor.yellow
        }
    }
}
