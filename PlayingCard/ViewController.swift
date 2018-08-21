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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
           if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

