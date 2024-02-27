//
//  SettingsViewController.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 05.02.2024.
//

import Foundation
import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: ISettingsPresenter
    
    private var avatarImage: UIImageView
    private var nameLabel: UILabel = UILabel()
    private var nameTextField: CustomTextField
    private var difficultyTextField: DifficultyTextField
    
    private(set) lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.configure(title: "Save")
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(presenter: ISettingsPresenter) {
        self.presenter = presenter
        let model = presenter.fetchSettings()
        self.avatarImage = UIImageView(image: UIImage(named: model.avatar))
        self.nameLabel.text = model.name
        self.nameLabel.font = .systemFont(ofSize: Constants.mediumFontSize)
        self.nameTextField = CustomTextField(placeholder: "Enter new name")
        self.difficultyTextField = DifficultyTextField(placeholder: model.difficulty)
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
    
    // MARK: - Methods
    
    @objc private func buttonAction() {
        let model = SettingsModel(avatar: Constants.defaultAvatarName, 
                                  name: self.nameTextField.text ?? self.nameLabel.text!,
                                  difficulty: self.difficultyTextField.text ?? self.difficultyTextField.placeholder!)
        self.presenter.saveSettings(model: model)
    }
    
    private func addSubviews() {
        self.view.addSubview(self.avatarImage)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.difficultyTextField)
        self.view.addSubview(self.saveButton)
        
        self.avatarImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.bigOffset)
            make.leading.equalToSuperview().offset(Constants.mediumOffset)
            make.trailing.equalToSuperview().offset(-Constants.mediumOffset)
            make.height.equalTo(self.avatarImage.snp.width)
            make.centerX.equalToSuperview()
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.avatarImage.snp.bottom).offset(Constants.lowOffset)
            make.centerX.equalToSuperview()
        }
        
        self.nameTextField.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(Constants.offset)
            make.leading.equalToSuperview().offset(Constants.mediumOffset)
            make.trailing.equalToSuperview().offset(-Constants.mediumOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.textFieldHeight)
        }
        
        self.difficultyTextField.snp.makeConstraints { make in
            make.top.equalTo(self.nameTextField.snp.bottom).offset(Constants.lowOffset)
            make.leading.equalToSuperview().offset(Constants.mediumOffset)
            make.trailing.equalToSuperview().offset(-Constants.mediumOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.textFieldHeight)
        }
        
        self.saveButton.snp.makeConstraints { make in
            make.top.equalTo(self.difficultyTextField.snp.bottom).offset(Constants.mediumOffset)
            make.leading.equalToSuperview().offset(Constants.bigOffset)
            make.trailing.equalToSuperview().offset(-Constants.bigOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.buttonHeight)
        }
    }
}
