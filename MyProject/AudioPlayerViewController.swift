//
//  AudioPlayerViewController.swift
//  MyProject
//
//  Created by Sergio Chocobar on 05/11/2021.
//

import UIKit
import SwiftySound

class AudioPlayerViewController: UIViewController {
    
    var isPlaying = true
    var song: Sound?
    
    
    override func viewDidLoad() {
        /*---------------------------------*/
        guard let url = Bundle.main.url(forResource: "cancion-ukelele", withExtension: ".mp3") else { return }
        song = Sound(url: url)
        Sound.enabled = true
        song?.play()
        /*---------------------------------*/
        super.viewDidLoad()
        //Label
        let label1 = UILabel()
        label1.text = "AudioPlayer"
        label1.font = UIFont.systemFont(ofSize: 30)
        label1.backgroundColor = UIColor(named: "AccentColor")
        label1.autoresizingMask = .flexibleWidth
        label1.translatesAutoresizingMaskIntoConstraints=true
        label1.frame=CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50)
        label1.textAlignment = .center
        self.view.addSubview(label1)
        
        //Boton Play
        let b1=UIButton(type: .system)
        b1.setTitle("Play", for: .normal)
        b1.autoresizingMask = .flexibleWidth
        b1.translatesAutoresizingMaskIntoConstraints=true
        b1.frame=CGRect(x: 20, y: 100, width: 100, height: 40)
        self.view.addSubview(b1)
        /**--------**/
        b1.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        
        //Boton Stop
        let b2=UIButton(type: .system)
        b2.setTitle("Stop", for: .normal)
        b2.autoresizingMask = .flexibleWidth
        b2.translatesAutoresizingMaskIntoConstraints=true
        b2.frame=CGRect(x: 200, y: 100, width: 100, height: 40)
        self.view.addSubview(b2)
        /**--------**/
        b2.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        
        //Slider Reproduccion
        let s1 = UISlider()
        s1.autoresizingMask = .flexibleWidth
        s1.translatesAutoresizingMaskIntoConstraints=true
        s1.frame=CGRect(x: 20, y:150, width: self.view.frame.width-40, height: 50)
        self.view.addSubview(s1)
        
        
        //Label Volumen
        let label2 = UILabel()
        label2.text = "Volumen"
        label2.font = UIFont.systemFont(ofSize: 16)
        label2.autoresizingMask = .flexibleWidth
        label2.translatesAutoresizingMaskIntoConstraints=true
        label2.frame=CGRect(x: 50, y: 200, width: self.view.frame.width, height: 50)
        label2.textAlignment = .left
        self.view.addSubview(label2)
        
        
        //Slider Volumen
        let s2 = UISlider()
        s2.autoresizingMask = .flexibleWidth
        s2.translatesAutoresizingMaskIntoConstraints=true
        s2.frame=CGRect(x: 20, y:250, width: self.view.frame.width-200, height: 50)
        self.view.addSubview(s2)
        /**--------**/
        s2.addTarget(self, action: #selector(slider2Touch(_ :)), for: .valueChanged)
        
        //GIF AUDIO
        if let laURL = Bundle.main.url(forResource: "gif-audio", withExtension: ".gif") {
            let elGIF = UIImage.animatedImage(withAnimatedGIFURL: laURL)
            let imgContainer = UIImageView(image: elGIF)
            imgContainer.autoresizingMask = .flexibleWidth
            imgContainer.translatesAutoresizingMaskIntoConstraints=true
            imgContainer.frame=CGRect(x: 0, y: 350, width: self.view.frame.width, height: 150)
            self.view.addSubview(imgContainer)
        }
    }

    @objc func playAction() {
        if (!isPlaying) {
            song?.play()
            isPlaying = true
        }
    }
    
    @objc func stopAction() {
        if (isPlaying) {
            song?.stop()
            isPlaying = false
        }
    }
    
    @objc func slider2Touch(_ sender:UISlider!) {
        song?.volume = sender.value
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if isPlaying {
            song?.stop()
            isPlaying = false
        } else {
            song?.play()
            isPlaying = true
        }
    }
}