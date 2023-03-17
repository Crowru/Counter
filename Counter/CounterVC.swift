//
//  CounterVC.swift
//  Counter
//
//  Created by Руслан  on 17.03.2023.
//

import UIKit

class CounterVC: UIViewController {
    @IBOutlet weak var buttonPlusOne: UIButton!
    @IBOutlet weak var labelPlusOne: UILabel!
    @IBOutlet weak var buttonMinusOne: UIButton!
    @IBOutlet weak var labelMinusOne: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var history: UITextView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(set: "BG")
        counterLabel.text = String(counter)
        history.text = "История изменений: \n"
        history.isEditable = false
        
        
        
    }
    
    
    private func updateCounterLabelColor() {
        counterLabel.textColor = counter > 0 ? #colorLiteral(red: 0.4186032414, green: 0.8380779624, blue: 0.673150599, alpha: 1) : #colorLiteral(red: 0.6341611743, green: 0.892775178, blue: 1, alpha: 1)
        }
    
    private func logReset() {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: date)

            let message = "\(dateString): значение сброшено"
            history.text.append(message + "\n")
        }
    
    private func logError() {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: date)

            let message = "\(dateString): попытка уменьшить значение счётчика ниже 0"
            history.text.append(message + "\n")
        }
    
    private func logHistoryPlus() {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: date)

            let message = "\(dateString): значение изменено на +1"
            history.text.append(message + "\n")
        }
    
    private func logHistoryMinus() {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: date)

            let message = "\(dateString): значение изменено на -1"
            history.text.append(message + "\n")
        }
    
    private func automaticScrolling() {
        let bottom = NSMakeRange(history.text.count - 1, 1)
        history.scrollRangeToVisible(bottom)
    }
    
    @IBAction func buttonPlusOneAction(_ sender: UIButton) {
        counter += 1
        counterLabel.text = String(counter)
        updateCounterLabelColor()
        logHistoryPlus()
        automaticScrolling()
        

    }
    
    @IBAction func buttonMinusOneAction(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = String(counter)
            updateCounterLabelColor()
            logHistoryMinus()
            automaticScrolling()

        } else {
            logError()
            automaticScrolling()

        }

    }
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        counter = 0
        counterLabel.text = String(counter)
        updateCounterLabelColor()
        logReset()
        automaticScrolling()


    }
    
}

extension UIViewController {
    
    func setBackgroundImage(set image: String) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "\(image)")
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
