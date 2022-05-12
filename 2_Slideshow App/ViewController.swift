//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 星涼子 on 2022/04/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var onPrev: UIButton!
    @IBOutlet weak var onNext: UIButton!
    
    //画像の名前の配列
    let imageNameArray:[UIImage] = [
        UIImage(named: "kirin")!,
        UIImage(named: "zou")!,
        UIImage(named: "hyo")!
    ]
    
    @IBAction func tapAction(_ sender: Any) {
        
        if self.timer != nil {
            print("タイマー停止")
            startButton.setTitle("再生", for: .normal)
            onPrev.isEnabled = true
            onNext.isEnabled = true
            timer.invalidate()
            self.timer = nil
        }
        //セグエを使用し画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    
    //ResultViewControllerへ渡したい値の代入
    override func prepare(for segue:UIStoryboardSegue,sender: Any?){
        if segue.identifier == "result" {
            let expansionView = segue.destination as! ResultViewController
            expansionView.image = imageView.image!
            
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    //進むボタン
    @IBAction func onPrev(_ sender: AnyObject) {
        
        //表示している画像の番号を１増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    @IBAction func onNext(_ sender: AnyObject) {
        
        //表示している画像の番号を１減らす
        dispImageNo -= 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    ///表示している画像の番号
    var dispImageNo = 0
    
    ///表示している画像の番号を元に画像を表示する
    func displayImage(){
        
        //画像の番号が正常な範囲を指しているかチェック
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        //image Viewが読み込んだ画像をセット
        imageView.image = imageNameArray[dispImageNo]
        
    }
    
    @IBAction func unwind(_segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // スライドショーの自動再生
    
    //Outletの接続
    @IBOutlet weak var startButton: UIButton!
    
    //スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    @IBAction func startButton(_ sender: Any) {
        
        //再生中か停止しているかの判定
        if (timer == nil) {
            //再生時の処理を実装
            
            //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            //ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
            //進む、戻るボタンを無効化する
            onPrev.isEnabled = false
            onNext.isEnabled = false
            
        }else{
            //停止時の処理を実装
            //タイマーを停止する
            timer.invalidate()
            
            //タイマーを削除しておく
            timer = nil
            
            //ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            
            //進む、戻るボタンを有効化する
            onPrev.isEnabled = true
            onNext.isEnabled = true
            
        }
    }
    
    @objc func changeImage() {
        //dispImageNOを増やして表示する画面を切り替える
        dispImageNo += 1
        
        //dispImageNOが表示予定の画面数を同じ場合
        if (dispImageNo == imageNameArray.count) {
            //dispImageNOを一番最初の数字に戻す
            dispImageNo = 0
        }
        //dispImageNoの画像をstoryboardの画像にセットする
        imageView.image = imageNameArray[dispImageNo]
    }
}

