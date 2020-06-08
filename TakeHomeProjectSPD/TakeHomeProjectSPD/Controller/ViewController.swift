//
//  ViewController.swift
//  TakeHomeProjectSPD
//
//  Created by Mondale on 6/2/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        getWeatherData()
    }


    func getWeatherData(){
        NetworkManager.shared.getWeather() { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                print("This is passing")
            case .failure(let error):
                print("This shit is failing")
                print(error.rawValue)
                
//                let alert = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                self.present(alert,animated: true)
            }
        }
    }
}

