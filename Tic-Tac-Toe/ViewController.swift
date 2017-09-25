//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Dylan Rothfeld on 9/25/17.
//  Copyright © 2017 Dylan Rothfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Game Values
    var gameState = [[Int]]()
    var playerTurn = "RED"
    
    // UI Elements
    @IBOutlet weak var B00: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(tap))
        B00.addGestureRecognizer(gestureRecognizerOne)
        B00.isUserInteractionEnabled = true
        gestureRecognizerOne.numberOfTapsRequired = 1
        gestureRecognizerOne.numberOfTouchesRequired = 1
    }
    
    // User Touch Interatction
    @objc func tap(gestureRecognizer: UITapGestureRecognizer) {
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

