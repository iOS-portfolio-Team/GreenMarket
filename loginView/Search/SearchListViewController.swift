//
//  SearchListViewController.swift
//  loginView
//
//  Created by 고종찬 on 2021/03/10.
//

import UIKit

class SearchListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //데이터 베이스에서 가져온 값만큼 불러오기
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchListCell", for: indexPath) as? SearchListCollectionViewCell
        cell?.imageView.image = UIImage(named: "flower_0\(indexPath.row+1)")
        cell?.labelTitle.text =  "타이틀 flower_0\(indexPath.row+1)"
        cell?.labelSubTitle.text =  "서브타이틀 flower_0\(indexPath.row+1)"
        cell?.viewRating.rating = Double((indexPath.row+1)/2)
        
        return cell!
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
