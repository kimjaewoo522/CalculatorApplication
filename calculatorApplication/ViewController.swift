//
//  ViewController.swift
//  calculatorApplication
//
//  Created by 김재우 on 3/28/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton()
    let horizontalStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        setConstraints()
    }

    func configureUI() {
        [label, button, horizontalStackView].forEach {
            view.addSubview($0)
        }
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.backgroundColor = .black
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
       
        let buttonTitles = ["7", "8", "9", "+"]
        for title in buttonTitles {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 40
            
            button.snp.makeConstraints { $0.width.height.equalTo(80) }
            horizontalStackView.addArrangedSubview(button)
        }
    }
    
    func setConstraints() {
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.height.equalTo(80)
        }
    }
    
}

