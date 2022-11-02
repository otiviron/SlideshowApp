//
//  ZoomPicViewController.swift
//  SlideshowApp
//
//  Created by koi on 2022/11/01.
//

import UIKit

class ZoomPicViewController: UIViewController {
    @IBOutlet weak var backpageButton: UIButton!
    @IBOutlet weak var zoomimageView: UIImageView!
    
    //画像遷移
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomimageView.image = image
        // Do any additional setup after loading the view.
    }
    
    //戻るボタン
    @IBAction func backpageButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
