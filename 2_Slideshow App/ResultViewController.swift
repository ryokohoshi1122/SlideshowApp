//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 星涼子 on 2022/04/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var expansionView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expansionView.image = image
        
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
