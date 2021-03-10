//
//  CategoryViewController.swift
//  loginView
//
//  Created by 고종찬 on 2021/03/10.
//

import UIKit

class CategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var categoryList = ["상추/쌈채소","시금치/나물류","오이/호박/가지","감자/고구마","손질/이색채소","특수채소","샐러드용채소","파프리카/고추","당근/뿌리채소","양파/파/마늘","새송이/버섯류","양상추/양배추","배추/김장채소","고구마"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryListCell", for: indexPath) as? CategoryListCollectionViewCell
        
        cell?.imageCategory.image = UIImage(named: "flower_0\(indexPath.row+1).png")
        
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
