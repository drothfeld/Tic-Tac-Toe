//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Dylan Rothfeld on 9/25/17.
//  Copyright © 2017 Dylan Rothfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements
    @IBOutlet weak var B00: UIImageView!
    @IBOutlet weak var B01: UIImageView!
    @IBOutlet weak var B02: UIImageView!
    @IBOutlet weak var B03: UIImageView!
    @IBOutlet weak var B04: UIImageView!
    @IBOutlet weak var B05: UIImageView!
    @IBOutlet weak var B06: UIImageView!
    @IBOutlet weak var B07: UIImageView!
    @IBOutlet weak var B08: UIImageView!
    
    // Game Values
    var gameState = [[Int]]()
    var playerTurn = "RED"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameSetup()
    }
    
    func gameSetup() {
        let gameImageViews = [B00, B01, B02, B03, B04, B05, B06, B07, B08]
        
        for imageView in gameImageViews {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
            imageView?.addGestureRecognizer(tapGestureRecognizer)
            imageView?.isUserInteractionEnabled = true
            tapGestureRecognizer.numberOfTapsRequired = 1
            tapGestureRecognizer.numberOfTouchesRequired = 1
        }
    }
    
    // User Touch Interatction
    @objc func tapResponse(gestureRecognizer: UITapGestureRecognizer) {
        let tappedImageColor = gestureRecognizer.view?.backgroundColor
        self.B00.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

