//
//  ViewController.swift
//  tutorialCustomViewFlowLayout
//
//  Created by lalo on 29/04/18.
//  Copyright © 2018 devchilango. All rights reserved.
//

import UIKit

enum typeCells {
    case rectangle
    case circle
}

struct sectionMovies {
    let title:String
    let totalMovies:Int
    let type:typeCells
    let sizeMovies:CGSize
}


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var elements:[Int] = []
    let cellIdentifier = "cell"
    let dataCollectionView:[sectionMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        for index in 1...10{
            elements.append(index)
        }
        
        collectionView.register( UICollectionViewCell.self , forCellWithReuseIdentifier: cellIdentifier)
        
        let layout = CustomFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    
}

