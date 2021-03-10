//
//  DetailViewController.swift
//  GreenMarketRnD
//
//  Created by 고종찬 on 2021/03/09.
//

import UIKit

class MainDetailViewController: UIViewController {
    @IBOutlet weak var viewQuantity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewQuantity.layer.borderWidth = 1
        viewQuantity.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        viewQuantity.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
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
