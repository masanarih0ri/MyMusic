//
//  ViewController.swift
//  MyMusic
//
//  Created by 堀 恭子 on 2017/05/20.
//  Copyright © 2017年 MasanariHori. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//シンバルの音源ファイルを設定
let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")

//シンバル用のプレイヤーインスタンスを作成
var cymbalPlayer = AVAudioPlayer()
    
    
    @IBAction func cymbal(_ sender: AnyObject) {
        do {
            //シンバル用のプレイヤーに音源ファイル名を指定
            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
            cymbalPlayer.play()
        } catch {
            print("シンバルでエラーが発生しました")
        }
        
    }
}

