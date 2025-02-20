//
//  ViewController.swift
//  Counter
//
//  Created by Эльдар on 17.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ResetCount: UIButton!
    @IBOutlet weak var TitleMinus: UIButton!
    @IBOutlet weak var ttitle: UIButton!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var History: UITextView!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        History.text = "История изменений"
        Update()
    }
    
    @IBAction func Plus1(_ sender: Any) {
        count += 1
        Update()
        UpdToHistory(sms: "Значение изменено на + 1")
    }
    @IBAction func Minus1(_ sender: Any) {
        if count > 0 {
            count -= 1
            UpdToHistory(sms: "Значение изменено на -1")
        } else {
            UpdToHistory(sms: "Попытка уменшить ниже 0")
        }
        
        Update()
    }
    
    @IBAction func Reset(_ sender: Any) {
        count = 0
        UpdToHistory(sms: "Очищено")
        Update()
    }
    
    private func Update() {
        Count.text = "\(count)"
    }
    
    private func UpdToHistory(sms: String) {
        let dateFormating = DateFormatter()
        dateFormating.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = dateFormating.string(from: Date())
        
        let historySms = "[\(currentDate)]: \(sms)\n"
        
        History.text = History.text + historySms
        
        let bottom = NSRange(location: History.text.count, length: 1)
        History.scrollRangeToVisible(bottom)
    }
}

