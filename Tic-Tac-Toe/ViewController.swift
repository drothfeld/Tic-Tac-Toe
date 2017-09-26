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
    @IBOutlet weak var P0: UILabel!
    @IBOutlet weak var P1: UILabel!
    @IBOutlet weak var newGame: UIButton!
    
    // Game Constants
    let empty = UIColor.black
    let playerOne = UIColor.red
    let playerTwo = UIColor.blue
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
    var playerTurn = UIColor.red
    var playerOneScore = 0
    var playerTwoScore = 0
    var gameOver = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameSetup()
    }
    
    func gameSetup() {
        gameOver = false
        newGame.isHidden = true
        let gameImageViews = [B00, B01, B02, B03, B04, B05, B06, B07, B08]
        gameState = [ [empty, empty, empty], [empty, empty, empty], [empty, empty, empty] ]
        
        for imageView in gameImageViews {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
            imageView?.addGestureRecognizer(tapGestureRecognizer)
            imageView?.isUserInteractionEnabled = true
            imageView?.backgroundColor = empty
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
    
    @objc func tapResponse(gestureRecognizer: UITapGestureRecognizer) {
        let tappedImageColor = gestureRecognizer.view?.backgroundColor
        if (tappedImageColor != playerOne && tappedImageColor != playerTwo && !gameOver) {
            let currentPlayerColor: UIColor
            if (playerTurn == playerOne) {
                currentPlayerColor = playerOne
            } else {
                currentPlayerColor = playerTwo
            }
            gestureRecognizer.view?.backgroundColor = currentPlayerColor
            
            updateGameState(currentPlayerColor: currentPlayerColor, imageTag: view!.tag)
            checkGameState()
            playerTurnSwitch()
        }
    }
    
    func checkGameState() {
        // Top Row
        let winCondition00 = (gameState[0][0] != empty && gameState[0][0] == gameState[0][1] && gameState[0][1] == gameState[0][2])
        // Middle Row
        let winCondition01 = (gameState[1][0] != empty && gameState[1][0] == gameState[1][1] && gameState[1][1] == gameState[1][2])
        // Bottom Row
        let winCondition02 = (gameState[2][0] != empty && gameState[2][0] == gameState[2][1] && gameState[2][1] == gameState[2][2])
        // Left Column
        let winCondition03 = (gameState[0][0] != empty &&  gameState[0][0] == gameState[1][0] && gameState[1][0] == gameState[2][0])
        // Middle Column
        let winCondition04 = (gameState[0][1] != empty && gameState[0][1] == gameState[1][1] && gameState[1][1] == gameState[2][1])
        // Right Column
        let winCondition05 = (gameState[0][2] != empty && gameState[0][2] == gameState[1][2] && gameState[1][2] == gameState[2][2])
        // Across Decline
        let winCondition06 = (gameState[0][0] != empty && gameState[0][0] == gameState[1][1] && gameState[1][1] == gameState[2][2])
        // Across Incline
        let winCondition07 = (gameState[0][2] != empty && gameState[0][2] == gameState[1][1] && gameState[1][1] == gameState[2][0])
        
        // A Win Condition is Met
        if (winCondition00 || winCondition01 || winCondition02 || winCondition03 || winCondition04 || winCondition05 || winCondition06 || winCondition07) {
            updateScores(winningPlayer: playerTurn)
        }
    }
    
    func updateScores(winningPlayer: UIColor) {
        // Player One Wins
        if (winningPlayer == playerOne) {
            playerOneScore += 1
            P0.text = String(playerOneScore)
        // Player Two Wins
        } else {
            playerTwoScore += 1
            P1.text = String(playerTwoScore)
        }
        gameOver = true
        newGame.isHidden = false
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
    @IBAction func newGame(_ sender: Any) {
        gameSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

