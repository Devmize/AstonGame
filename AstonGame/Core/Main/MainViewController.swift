//
//  ViewController.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 18.01.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: IMainPresenter
    
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.configure(title: "Start")
        button.addTarget(self, action: #selector(self.openRace), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.configure(title: "Settings")
        button.addTarget(self, action: #selector(self.openSettings), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var recordsButton: UIButton = {
        let button = UIButton(type: .system)
        button.configure(title: "Records")
        button.addTarget(self, action: #selector(self.openRecords), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(presenter: IMainPresenter) {
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
    }
    
    // MARK: - Functions
    
    @objc private func openRace() {
        let viewController = RaceAssembly().assemble()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func openSettings() {
        let viewController = SettingsAssembly().assemble()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func openRecords() {
        let viewController = RecordsAssembly().assemble()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    private func addSubviews() {
        self.view.addSubview(self.containerView)
        self.containerView.addSubview(self.startButton)
        self.containerView.addSubview(self.settingsButton)
        self.containerView.addSubview(self.recordsButton)
        
        self.containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.lowOffset)
            make.trailing.equalToSuperview().offset(-Constants.lowOffset)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.settingsButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.lowOffset)
            make.trailing.equalToSuperview().offset(-Constants.lowOffset)
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.buttonHeight)
        }
        
        self.startButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.lowOffset)
            make.trailing.equalToSuperview().offset(-Constants.lowOffset)
            make.bottom.equalTo(self.settingsButton.snp.top).offset(-Constants.offset)
            make.height.equalTo(Constants.buttonHeight)
        }
        
        self.recordsButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.lowOffset)
            make.trailing.equalToSuperview().offset(-Constants.lowOffset)
            make.top.equalTo(self.settingsButton.snp.bottom).offset(Constants.offset)
            make.height.equalTo(Constants.buttonHeight)
        }
    }

}

