//
//  ViewController.swift
//  TakeHomeProjectSPD
//
//  Created by Mondale on 6/2/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weatherImageView = UIImageView()
    var descriptionLabel = UILabel()
    let moodLabel = UILabel()
    var emojiLabal = UILabel()
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getWeatherData()
        view.backgroundColor = .systemTeal
    }


    private func configure(){
        stackView.backgroundColor = .red

        stackView.alignment = .center
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(moodLabel)
        stackView.addArrangedSubview(emojiLabal)
        
        
        moodLabel.text = "Mood:"

        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
    
    
    func getWeatherData(){
        NetworkManager.shared.getWeather() { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let weather):
                DispatchQueue.main.async {
                    self.descriptionLabel.text = weather.description
                }
            case .failure(let error):
                
                print(error.rawValue)

            }
        }
    }
}

