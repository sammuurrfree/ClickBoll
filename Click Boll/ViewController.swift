//
//  ViewController.swift
//  Click Boll
//
//  Created by Преподавтель on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bollView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var heightConstarint: NSLayoutConstraint!
    @IBOutlet weak var widthConstarint: NSLayoutConstraint!
    
    
    var widthNumber: Double = 0.0
    var time = 0.00
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.isHidden = true
        reloadAndLoad()
    }
    
    @IBAction func startButtonMethod(_ sender: UIButton) {
        setViews(isVin: true, isHide: true)
        reloadAndLoad()
    }
    
    
    @IBAction func viewTapMethod (_ sender: Any?) {
        if view.frame.width <= widthNumber + 10 {
            
        }else if widthNumber <= -1{
        }else{
            widthNumber += 12
            updateFrame()
        }
    }
    
    
    func updateFrame() {
        heightConstarint.constant = widthNumber
        widthConstarint.constant = widthNumber
        bollView.layer.cornerRadius = widthNumber / 2
    }
    
    
    func reloadAndLoad(){
        time = 0.0
        widthNumber = view.bounds.width / 2
        updateFrame()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    
    func setViews(isVin: Bool, isHide: Bool = false){
        if isHide{
            titleLabel.isHidden = true
            bollView.isHidden = false
            startButton.isHidden = true
            
            return
        }
        if isVin{
            titleLabel.textColor = .systemGreen
            titleLabel.text = "Победил за \(String(format:"%.2f", time)) секунд"
            titleLabel.isHidden = false
            bollView.isHidden = true
            startButton.isHidden = false
            
        }else{
            titleLabel.textColor = .red
            titleLabel.text = "Проиграл за \(String(format:"%.2f", time)) секунд"
            titleLabel.isHidden = false
            bollView.isHidden = true
            startButton.isHidden = false
        }
        
    }
    
    
    @objc func timerAction() {
        time += 0.01
        titleLabel.isHidden = false
        titleLabel.text = "Время \(String(format: "%.2f", time))"
        updateFrame()
        widthNumber -= 0.6
        if view.frame.width <= widthNumber + 10 { timer.invalidate()
            setViews(isVin: true)
        }else if widthNumber <= -1{ timer.invalidate()
            setViews(isVin: false) }
    }
}

