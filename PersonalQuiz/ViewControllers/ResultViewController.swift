//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet var resultQuestionsLabelOutlet: UILabel!
    @IBOutlet var descriptionAnimalTypeOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true

                var counter: [AnimalType : Int] = [:]
                
                answers.forEach {
                    if let currentValue = counter[$0.type] {
                        counter.updateValue(currentValue + 1, forKey: $0.type)
                    } else {
                        counter.updateValue(1, forKey: $0.type)
                    }
                }
                
                guard let animalType = (counter.sorted() {
                    $0.value > $1.value
                }).first else { return }
                
                resultQuestionsLabelOutlet.text = "\(animalType.key) - \(animalType.key.rawValue)"
                descriptionAnimalTypeOutlet.text = animalType.key.definition
        
        
    }
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
}
