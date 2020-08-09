//
//  MemeDetailViewController.swift
//  MemeMe v2
//
//  Created by Howard Snyder on 8/5/20.
//  Copyright © 2020 Howard Snyder. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeLabel.text = self.meme.topText
        self.tabBarController?.tabBar.isHidden = true
        self.memeImageView!.image = meme.memedImage
        
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
    //https://github.com/hs3082/MemMev2-8-9-123pm.git
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
