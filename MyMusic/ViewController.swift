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
    
//    @IBAction func cymbal(_ sender: AnyObject) {
//        do {
//            //シンバル用のプレイヤーに音源ファイル名を指定
//            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
//            cymbalPlayer.play()
//        } catch {
//            print("シンバルでエラーが発生しました")
//        }
//        
//    }
    
    //リファクタリング後
    @IBAction func cymbal(_ sender: AnyObject) {
        soundPlayer(&cymbalPlayer , path:cymbalPath, count: 0)
    }
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    //ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
//    @IBAction func guitar(_ sender: AnyObject) {
//        do {
//            //ギター用のプレイヤーに音源ファイル名を指定
//            guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
//            guitarPlayer.play()
//        } catch {
//            print("ギターでエラーが発生しました")
//        }
//    }
    //ギターリファクタリング後
    @IBAction func guitar(_ sender: AnyObject) {
        soundPlayer(&guitarPlayer , path:guitarPath, count: 0)
    }
    
    //バックミュージックの音源ファイル名を指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    //バックミュージック用のプレイヤーインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()
    
//    @IBAction func play(_ sender: AnyObject) {
//        do {
//            //バックミュージック用のプレイヤーに音源ファイル名を指定
//            backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
//            //リピート設定
//            backmusicPlayer.numberOfLoops = -1
//            backmusicPlayer.play()
//        } catch {
//            print("エラーが発生しました")
//        }
//    }
    @IBAction func play(_ sender: AnyObject) {
        soundPlayer(&backmusicPlayer , path:backmusicPath, count: -1)
    }
    @IBAction func stop(_ sender: AnyObject) {
        //バックミュージック停止
        backmusicPlayer.stop()
    }
    
    //共通のプレイヤー再生処理
    //fileprivateを使うことでこのファイルの中でのみ呼び出して使えるメソッド
    fileprivate func soundPlayer(_ player:inout AVAudioPlayer, path:URL, count: Int) {
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました")
        }
    }
}

