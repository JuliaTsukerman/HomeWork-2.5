//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnserLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        updateResult()
    }

    // MARK: - Public properties
    var responses:[Answer]!
    
    private func updateResult (){
        var animalFrequency: [AnimalType: Int] = [:]
        let animals = responses.map {$0.type}
        
        for animal in animals {
            animalFrequency[animal] = (animalFrequency[animal] ?? 0) + 1
        }
        
        let animalFrequencySorted = animalFrequency.sorted {$0.value > $1.value}
        guard let mostFrequentAnimal = animalFrequencySorted.first?.key else {return}
        
        updateLabels (with: mostFrequentAnimal)
    }
    private func updateLabels (with animal: AnimalType){
        resultAnserLabel.text = "Вы - \(animal.rawValue)"
        resultDefinitionLabel.text = "\(animal.definition)"
    }
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    
    
}
