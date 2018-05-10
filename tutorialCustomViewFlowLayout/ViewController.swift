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


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var mainTable:UITableView!
    
    var elements:[Int] = []
    let cellIdentifier = "cell"
    let cellIdentifierTable = "cellTable"
    var dataTableview:[sectionMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateDataMovies()
        
        setUtpTable()
        
        
        
        let layout = CustomFlowLayout()
        let rectCollection = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100)
        let collectionView = UICollectionView(frame: rectCollection, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        for index in 1...10{
            elements.append(index)
        }
        
        collectionView.register( UICollectionViewCell.self , forCellWithReuseIdentifier: cellIdentifierTable)
        
        
    }
    
    func setUtpTable(){
        
        mainTable = UITableView()
        mainTable.translatesAutoresizingMaskIntoConstraints = false
        mainTable.backgroundColor = .red
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.register( SectionTableCell.self , forCellReuseIdentifier: cellIdentifierTable)
        
        self.view.addSubview(mainTable)
        
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .top, relatedBy: .equal, toItem: mainTable, attribute: .top, multiplier: 1, constant: 0) )
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .left, relatedBy: .equal, toItem: mainTable, attribute: .left, multiplier: 1, constant: 0) )
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .right, relatedBy: .equal, toItem: mainTable, attribute: .right, multiplier: 1, constant: 0) )
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: mainTable, attribute: .bottom, multiplier: 1, constant: 0) )
        
        
    }
    
    func generateDataMovies(){
        
        let defaultSize = CGSize(width: 75, height: 100)
        
        let portraint = sectionMovies(title: "", totalMovies: 1, type: .rectangle, sizeMovies: CGSize(width: UIScreen.main.bounds.size.width, height: 400) )
        let popular = sectionMovies(title: "Populares", totalMovies: 10, type: .rectangle, sizeMovies: defaultSize )
        let thriller = sectionMovies(title: "Avances", totalMovies: 10, type: .circle, sizeMovies: defaultSize )
        let trending = sectionMovies(title: "Tendencias", totalMovies: 10, type: .rectangle, sizeMovies: defaultSize )
        let hollywood = sectionMovies(title: "Hollywood", totalMovies: 10, type: .rectangle, sizeMovies: defaultSize )
        
        dataTableview.append(portraint)
        dataTableview.append(popular)
        dataTableview.append(thriller)
        dataTableview.append(trending)
        dataTableview.append(hollywood)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataTableview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierTable, for: indexPath)
        return cell
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

