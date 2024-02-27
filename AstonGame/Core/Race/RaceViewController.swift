//
//  RaceViewController.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 26.02.2024.
//

import UIKit
import SnapKit

class RaceViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: IRacePresenter
    private var speed: Double = 0
    
    private lazy var carView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var firstEnemyCar: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var secondEnemyCar: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.regularFontSize)
        label.text = "\(self.presenter.getScore())"
        return label
    }()
    
    // MARK: - Lifecycle
    
    init(presenter: IRacePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.addSubviews()
        self.timersActivate()
        self.addGestures()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.speed = (self.view.frame.size.width - self.carView.frame.origin.x) * (2 / self.view.frame.size.height)
        self.carMovement(self.firstEnemyCar, CGFloat.init(integerLiteral: self.presenter.getSpeed()))
        self.carMovement(self.secondEnemyCar, CGFloat.init(integerLiteral: self.presenter.getSpeed()) + 3)
    }
    
    // MARK: - Methods
    
    @objc private func checkForCollision() {
        if let car = self.carView.layer.presentation()?.frame,
           let first = self.firstEnemyCar.layer.presentation()?.frame,
           let second = self.firstEnemyCar.layer.presentation()?.frame {
            if first.intersects(car) || second.intersects(car) {
                self.presenter.saveGameResult()
            }
        }
    }
    
    @objc private func addPointForScore() {
        self.presenter.addScore()
    }
    
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            UIView.animate(withDuration: TimeInterval(self.speed), delay: 0.0, options: .curveLinear) {
                self.carView.frame.origin.x += self.view.frame.width / 4
            }
        } else if gesture.direction == .left {
            UIView.animate(withDuration: TimeInterval(self.speed), delay: 0.0, options: .curveLinear) {
                self.carView.frame.origin.x -= self.view.frame.width / 4
            }
        }
    }
    
    private func addGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    private func timersActivate() {
        Timer.scheduledTimer(timeInterval: 0, target: self,
                                          selector: #selector(checkForCollision), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: 1, target: self,
                                          selector: #selector(addPointForScore), userInfo: nil, repeats: true)
    }
    
    private func carMovement(_ car: UIView, _ speed: CGFloat) {
        let carSpeed = speed / self.view.frame.size.height
        let averageSpeed = (self.view.frame.size.height - car.frame.origin.y) * carSpeed
        
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: { [weak self] in
            guard let self else { return }
            car.frame.origin.y = self.view.frame.size.height
        }) { _ in
            car.frame.origin.y = -car.frame.size.height
            self.carMovement(car, speed)
        }
    }
    
    private func addSubviews() {
        self.view.addSubview(self.carView)
        self.view.addSubview(self.firstEnemyCar)
        self.view.addSubview(self.secondEnemyCar)
        self.view.addSubview(self.scoreLabel)
        
        self.scoreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.mediumOffset)
            make.trailing.equalToSuperview().offset(-Constants.offset)
        }
        
        self.carView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalTo(self.view.frame.width / 4 / 2 + self.view.frame.width / 4)
            make.width.height.equalTo(self.view.frame.width / 4 - 20)
        }
        
        self.firstEnemyCar.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.frame.width / 4 / 2 + self.view.frame.width / 4)
            make.width.height.equalTo(self.view.frame.width / 4 - 20)
        }
        
        self.secondEnemyCar.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.frame.width / 4 / 2 + self.view.frame.width / 4 * 2)
            make.width.height.equalTo(self.view.frame.width / 4 - 20)
        }
    }

}
