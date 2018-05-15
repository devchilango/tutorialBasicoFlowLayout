//
//  SectionTableCell.swift
//  tutorialCustomViewFlowLayout
//
//  Created by CRM on 10/05/18.
//  Copyright © 2018 devchilango. All rights reserved.
//

import UIKit

class SectionTableCell: UITableViewCell {
    
    var titleView:UIView!
    var collectionMovies:UICollectionView!
    var sizeItem = CGSize.zero
    var sizetitle:Int = 0
    let layout = CustomFlowLayout()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor.init(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        
        collectionMovies = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionMovies.translatesAutoresizingMaskIntoConstraints = false
        collectionMovies.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        
        self.contentView.addSubview(titleView)
        self.contentView.addSubview(collectionMovies)
        
        

        
    }
    
    func setSizes( size:CGSize, sizeHeader:Int, space:Int ){
        layout.sizeItem = size
        layout.space = space
        sizetitle = sizeHeader
        collectionMovies.collectionViewLayout.invalidateLayout()
        setConstraints()
    }
    
    func setConstraints(){

        self.contentView.addConstraint( NSLayoutConstraint(item: titleView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: titleView, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: titleView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 0) )
        titleView.heightAnchor.constraint(equalToConstant: CGFloat(sizetitle) ).isActive = true

        self.contentView.addConstraint( NSLayoutConstraint(item: collectionMovies, attribute: .top, relatedBy: .equal, toItem: titleView, attribute: .bottom, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .equal, toItem: collectionMovies, attribute: .bottom, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .left, relatedBy: .equal, toItem: collectionMovies, attribute: .left, multiplier: 1, constant: 0) )
        self.contentView.addConstraint( NSLayoutConstraint(item: self.contentView, attribute: .right, relatedBy: .equal, toItem: collectionMovies, attribute: .right, multiplier: 1, constant: 0) )

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
