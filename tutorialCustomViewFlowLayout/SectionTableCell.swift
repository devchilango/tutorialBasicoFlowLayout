//
//  SectionTableCell.swift
//  tutorialCustomViewFlowLayout
//
//  Created by CRM on 10/05/18.
//  Copyright © 2018 devchilango. All rights reserved.
//

import UIKit

class SectionTableCell: UITableViewCell {
    
    var collectionMovies:UICollectionView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let etiqueta = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20) )
        etiqueta.backgroundColor = .red
        
        self.contentView.addSubview(etiqueta)
    }
    
    func setDelegate( delegate:ViewController ) {
        self.collectionMovies.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
