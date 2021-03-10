//
//  ViewController.swift
//  GreenMarketRnD
//
//  Created by 고종찬 on 2021/03/09.
//

import UIKit
import Cosmos

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

 
    @IBOutlet weak var ratingProduct1: CosmosView!
    @IBOutlet weak var ratingProduct2: CosmosView!

    
    @IBOutlet weak var collectionView: UICollectionView!
    var imagesPath = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

       
        
        ratingProduct1.rating = 3
        ratingProduct2.rating = 5
        
        ratingProduct1.isUserInteractionEnabled = false
        ratingProduct2.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
   
    
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesPath.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainViewCell", for: indexPath) as! MainCollectionViewCell
        cell.image.image = UIImage(named: "w\(indexPath.row+1).jpg")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
    }

   
}

