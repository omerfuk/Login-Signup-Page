//
//  ViewController.swift
//  Login-Signup-Page
//
//  Created by Ömer Faruk Kılıçaslan on 1.06.2022.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //set up video in the background
        
        setUpVideo()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    func setUpVideo() {
        //get the path to the resource in bundle
        let bundlePath = Bundle.main.path(forResource: "frizbi", ofType: "mp4")
        
        guard bundlePath != nil else{return}
        //Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        //Create the viode player item
        let item = AVPlayerItem(url: url)
        
        //Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        //Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        //ADjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        //add it to the view and play it,
        videoPlayer?.playImmediately(atRate: 0.3)
    }

}

