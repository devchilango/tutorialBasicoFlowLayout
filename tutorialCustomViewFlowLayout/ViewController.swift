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
    let titleSize:Int
    let totalMovies:Int
    let type:typeCells
    let sizeMovies:CGSize
    let space:Int
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
        
    }
    
    func setUtpTable(){
        
        mainTable = UITableView()
        mainTable.translatesAutoresizingMaskIntoConstraints = false
        mainTable.backgroundColor = .red
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.register( SectionTableCell.self , forCellReuseIdentifier: cellIdentifierTable)
        mainTable.separatorStyle = .none //this delete de space beetween tableviewCell, to fit well the collectionviews height and its contentsize
        mainTable.allowsSelection = false
        
        self.view.addSubview(mainTable)
        
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .top, relatedBy: .equal, toItem: mainTable, attribute: .top, multiplier: 1, constant: 0) )
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .left, relatedBy: .equal, toItem: mainTable, attribute: .left, multiplier: 1, constant: 0) )
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .right, relatedBy: .equal, toItem: mainTable, attribute: .right, multiplier: 1, constant: 0) )
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: mainTable, attribute: .bottom, multiplier: 1, constant: 0) )
        
        
    }
    
    func generateDataMovies(){
        
        let defaultSize = CGSize(width: 75, height: 100)
        
        let portraint = sectionMovies(title: "", titleSize: 0, totalMovies: 1, type: .rectangle, sizeMovies: CGSize(width: UIScreen.main.bounds.size.width, height: 250), space:0 )
        let popular = sectionMovies(title: "Populares", titleSize: 30, totalMovies: 10, type: .rectangle, sizeMovies: defaultSize, space:10 )
        let thriller = sectionMovies(title: "Avances", titleSize: 30, totalMovies: 10, type: .circle, sizeMovies: defaultSize, space:10 )
        let trending = sectionMovies(title: "Tendencias", titleSize: 30, totalMovies: 10, type: .rectangle, sizeMovies: defaultSize, space:10 )
        let hollywood = sectionMovies(title: "Hollywood", titleSize: 30, totalMovies: 10, type: .rectangle, sizeMovies: defaultSize, space:10 )
        
        dataTableview.append(portraint)
        dataTableview.append(popular)
        dataTableview.append(thriller)
        dataTableview.append(trending)
        dataTableview.append(hollywood)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTableview.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionMovie:sectionMovies = dataTableview[ indexPath.row ] as sectionMovies!
        
        let cell:SectionTableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierTable, for: indexPath) as! SectionTableCell
        cell.collectionMovies.delegate = self
        cell.collectionMovies.dataSource = self
        cell.collectionMovies.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        cell.collectionMovies.tag = indexPath.row
        cell.collectionMovies.showsHorizontalScrollIndicator = false
        cell.setSizes(size: sectionMovie.sizeMovies, sizeHeader: sectionMovie.titleSize, space: sectionMovie.space  )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionMovie:sectionMovies = dataTableview[ indexPath.row ] as sectionMovies!
        return sectionMovie.sizeMovies.height + CGFloat(sectionMovie.titleSize)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .white
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionMovie:sectionMovies = dataTableview[ collectionView.tag ] as sectionMovies!
        return sectionMovie.totalMovies
    }
    
    
}

