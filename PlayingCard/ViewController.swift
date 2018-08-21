//
//  ViewController.swift
//  PlayingCard
//
//  Created by 임지후 on 2018. 8. 21..
//  Copyright © 2018년 임지후. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
   
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy: )))
            playingCardView.addGestureRecognizer(pinch) //In simulator, you can pinch pressing "option" key
        }
    }
    @IBAction func filpCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
            case .ended:
                playingCardView.isFaceUp = !playingCardView.isFaceUp
            default: break
        }
    }
    
    @objc func nextCard(){
        if let card = deck.draw(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
           if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

