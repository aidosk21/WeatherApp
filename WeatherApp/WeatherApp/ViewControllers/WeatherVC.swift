//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aidos on 23.09.2022.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    var weatherManager = WeatherManager()
    
    
    @IBAction func searchPressed() {
        self.presentSearchAlertController(withTitle: "Enter the city Name", message: nil, style: .alert) { [unowned self ]city in
            self.weatherManager.showCurrentWeather(for: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.onCompletion = { [weak self] weather in
            guard let self else { return }
            self.updateInterface(weather: weather)
            
        }
        weatherManager.showCurrentWeather(for: "Almaty")
    }
    
    
    
    func updateInterface(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeLabel.text = weather.feelsLikeTemperatureString
            self.cityLabel.text = weather.cityName
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
       
        
    }


}

