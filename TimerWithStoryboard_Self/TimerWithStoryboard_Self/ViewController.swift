//
//  ViewController.swift
//  TimerWithStoryboard_Self
//
//  Created by 김태완 on 9/3/24.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpUI()
    }
     
    func setUpUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(slider.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // TODO: 슬라이더 작동, 소리 출력
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                setUpUI()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                timer?.invalidate()
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setUpUI()
        number = 0
        timer?.invalidate()
    }
}

