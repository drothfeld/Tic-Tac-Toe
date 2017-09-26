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
    
    // Game Constants
    let empty = UIColor.black
    let playerOne = 0
    let playerTwo = 1
    let block00 = 0
    let block01 = 1
    let block02 = 2
    let block03 = 3
    let block04 = 4
    let block05 = 5
    let block06 = 6
    let block07 = 7
    let block08 = 8
    
    // Game Values
    var gameState = [[UIColor]]()
    var playerTurn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameSetup()
    }
    
    func gameSetup() {
        let gameImageViews = [B00, B01, B02, B03, B04, B05, B06, B07, B08]
        gameState = [ [empty, empty, empty], [empty, empty, empty], [empty, empty, empty] ]
        
        for imageView in gameImageViews {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
            imageView?.addGestureRecognizer(tapGestureRecognizer)
            imageView?.isUserInteractionEnabled = true
            tapGestureRecognizer.numberOfTapsRequired = 1
            tapGestureRecognizer.numberOfTouchesRequired = 1
        }
    }
    
    func playerTurnSwitch() {
        if (playerTurn == playerOne) {
            playerTurn = playerTwo
        } else {
            playerTurn = playerOne
        }
    }
    
    // User Touch Interatction
    @objc func tapResponse(gestureRecognizer: UITapGestureRecognizer) {
        let tappedImageColor = gestureRecognizer.view?.backgroundColor
        if (tappedImageColor != UIColor.red && tappedImageColor != UIColor.blue) {
            let currentPlayerColor: UIColor
            if (playerTurn == playerOne) {
                currentPlayerColor = UIColor.red
            } else {
                currentPlayerColor = UIColor.blue
            }
            gestureRecognizer.view?.backgroundColor = currentPlayerColor
            
            updateGameState(currentPlayerColor: currentPlayerColor, imageTag: view!.tag)
            playerTurnSwitch()
        }
    }
    
    func updateGameState(currentPlayerColor: UIColor, imageTag: Int) {
        switch (imageTag) {
            // Row 1
            case block00:
                gameState[0][0] = currentPlayerColor
            case block01:
                gameState[0][1] = currentPlayerColor
            case block02:
                gameState[0][2] = currentPlayerColor
            // Row 2
            case block03:
                gameState[1][0] = currentPlayerColor
            case block04:
                gameState[1][1] = currentPlayerColor
            case block05:
                gameState[1][2] = currentPlayerColor
            // Row 3
            case block06:
                gameState[2][0] = currentPlayerColor
            case block07:
                gameState[2][1] = currentPlayerColor
            case block08:
                gameState[2][2] = currentPlayerColor
            default:
                break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

