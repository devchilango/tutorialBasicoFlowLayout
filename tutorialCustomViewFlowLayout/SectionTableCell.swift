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
    var sizeItem = CGSize.zero
    let layout = CustomFlowLayout()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        collectionMovies = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionMovies.translatesAutoresizingMaskIntoConstraints = false
        collectionMovies.backgroundColor = .blue
        
        self.contentView.addSubview(collectionMovies)
        
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .top, relatedBy: .equal, toItem: collectionMovies, attribute: .top, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .equal, toItem: collectionMovies, attribute: .bottom, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .left, relatedBy: .equal, toItem: collectionMovies, attribute: .left, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .right, relatedBy: .equal, toItem: collectionMovies, attribute: .right, multiplier: 1, constant: 0) )
        
    }
    
    func setSizeItem( size:CGSize ){
        layout.sizeItem = size
        layout.invalidateLayout()
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
