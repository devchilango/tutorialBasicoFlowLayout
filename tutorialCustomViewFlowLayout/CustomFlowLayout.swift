//
//  CustomFlowLayout.swift
//  tutorialCustomViewFlowLayout
//
//  Created by lalo on 29/04/18.
//  Copyright © 2018 devchilango. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    let sizeItem = 100
    var sizeCollection:CGSize!
    var totalItems:Int = 0
    let space:Int = 1
    
    override func prepare() {
        
        totalItems = self.collectionView?.numberOfItems(inSection: 0) ?? 0
        sizeCollection = CGSize(width: totalItems * sizeItem , height: sizeItem)
    }
    
    override var collectionViewContentSize: CGSize{
    
        return sizeCollection;
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributes:[UICollectionViewLayoutAttributes] = []
        
        var positionStart = 0
        for i in 0...totalItems-1{
            let indexPath = IndexPath(item: i, section: 0)
            if let attribute = self.layoutAttributesForItem(at: indexPath){
                
                attribute.frame = CGRect(x: positionStart, y: 0, width: sizeItem, height: sizeItem);
                attributes.append(attribute)
                
                positionStart += sizeItem + space
            }
        }
        
        return attributes
    }
    
    
}
