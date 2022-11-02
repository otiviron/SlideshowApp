//
//  ViewController.swift
//  SlideshowApp
//
//  Created by koi on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var currentImg: Int = 0
    var image: UIImage?
    //なぜ！が必要か
    var imageArray:[UIImage] = [
        UIImage(named:"letter_G")!,
        UIImage(named:"letter_O")!,
        UIImage(named:"letter_O2")!,
        UIImage(named:"letter_D")!,
        UIImage(named:"letter_J")!,
        UIImage(named:"letter_O3")!,
        UIImage(named:"letter_B")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //次へ
    //=+を使ってやってみる
    @IBAction func nextButton(_ sender: Any) {
        currentImg += 1
        //currentImgがimageArrayの個数（count）と同じ時(最後の画像のとき)、最初の画像を表示
        if (currentImg == imageArray.count){
            currentImg = 0
        }
        imageView.image = imageArray[currentImg]
                    
    }
    //戻ります
    @IBAction func backButton(_ sender: Any) {
        currentImg -= 1
        //nilはうまく使えなかった
        //配列が０番のとき６番に移動するようにした
        //けど最初に戻るを押したらエラーになる
        //最初に押しても落ちないようにする
        if (currentImg == -1) {
            currentImg = 6
        }
        imageView.image = imageArray[currentImg]
    }
    
    //スライドショー（自動）
    //タイマーの宣言
    var timer: Timer!
    //ボタンの表示変更用outlet
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var StartstopButton: UIButton!
    
    //自動再生、停止
    @IBAction func StartstopButton(_ sender: Any) {
        if (timer == nil) {
            //タイマーのセット
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            StartstopButton.setTitle("停止", for: .normal)
        }else {
            //nilじゃないなら、タイマーがあるなら
            //タイマーの停止
            timer.invalidate()
            nextButton.isEnabled = true
            backButton.isEnabled = true
            StartstopButton.setTitle("再生", for: .normal)
            //次の再生の準備
            timer = nil
        }
    }
    @objc func changeImage(){
        currentImg += 1
        if (currentImg == imageArray.count){
            currentImg = 0
        }
        imageView.image = imageArray[currentImg]
    }

    //画像遷移
    //override func prepare を調べる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ZoomPicViewController
        nextVC.image = imageView.image!
    }
    //画面遷移
    @IBAction func tapImage(_ sender: Any) {
        
        //画像押したらタイマー止める、ボタンを再生にする、次に再生するとき用にニルにする
        //次へと停止も使えるようにする
        if (timer != nil) {//タイマーがある場合
            timer.invalidate()
            nextButton.isEnabled = true
            backButton.isEnabled = true
            StartstopButton.setTitle("再生", for: .normal)
            timer = nil
        }
        //画面遷移presentでもできるみたい？
        self.performSegue(withIdentifier: "zoomPic", sender: self)
    }
    
}

