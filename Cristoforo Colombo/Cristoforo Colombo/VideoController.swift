//
//  VideoController.swift
//  Cristoforo Colombo
//
//  Created by Owner on 07/06/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import AVKit
import UIKit
import AVFoundation

class VideoController: UIViewController {
    
    var playerController = AVPlayerViewController()
    var player: AVPlayer?
    
    @IBOutlet weak var guardaAnteprima: UIButton!
    @IBAction func playVideo(_ sender: Any) {
        self.present(self.playerController, animated: true, completion: {
            self.playerController.player?.play()
            })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let videoString: String? = Bundle.main.path(forResource: "VideoLapi", ofType: "mov")
        if let url = videoString {
         let videoURL = NSURL(fileURLWithPath: url)
            self.player = AVPlayer(url: videoURL as URL)
            self.playerController.player = self.player
            
        }
    }
    
    
    
    
}
