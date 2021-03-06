//
//  HistoryController.swift
//  Discover City's
//
//  Created by Ferhan Akkan on 2.03.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase

class HistoryController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var outletButton: UIButton!
    
    var historyViewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setNavigationController()
        setOutlets()
    }
    
    func setOutlets() {
        let storage = Storage.storage()
        let gsReference = storage.reference(forURL: historyViewModel.getHistoryImage())
        
        gsReference.downloadURL { url, error in
            LoadingView.hide()
            if error != nil {
                print(error!)
            } else {
                self.imageView.kf.setImage(with: url)
            }
        }
        historyLabel.setTextWithTypeAnimation(typedText: historyViewModel.getHistoryLabel(), characterDelay:  5)
        
        outletButton.cornerRadius = 15

        let myColor = UIColor.rouge
        outletButton.layer.borderWidth = 3.0
        outletButton.layer.borderColor = myColor.cgColor
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        historyViewModel.toQuestion(owner: self)
    }
    
}

//MARK: - SetNavigationController

extension HistoryController {
    func setNavigationController() {
        navigationItem.hidesBackButton = true
        
        navigationItem.titleView = SingletonGameManager.shared.weatherUIView
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(leaveGame))    }
    
    @objc func leaveGame() {
        SingletonGameManager.shared.overTimer()
        let message = SingletonGameManager.shared.leaveGame(self)
        self.present(message, animated: true)
    }
}
