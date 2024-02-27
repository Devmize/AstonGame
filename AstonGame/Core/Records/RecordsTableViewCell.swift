//
//  RecordsTableViewCell.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 01.02.2024.
//

import Foundation
import UIKit

final class RecordsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static var identifier: String { "\(Self.self)" }
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.avatarImage.image = nil
        self.nameLabel.text = nil
        self.scoreLabel.text = nil
        self.dateLabel.text = nil
    }
    
    // MARK: - Methods
    
    func configure(with model: RecordModel) {
        self.avatarImage.image = UIImage(named: UserDefaults.standard.string(forKey: Constants.avatarKey) ?? Constants.defaultAvatarName)
        self.nameLabel.text = "\(model.name)"
        self.scoreLabel.text = "\(model.score)"
        self.dateLabel.text = "\(model.date)"
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.avatarImage)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.scoreLabel)
        self.contentView.addSubview(self.dateLabel)
        
        self.avatarImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.lowOffset)
            make.top.equalToSuperview().offset(Constants.lowOffset)
            make.bottom.equalToSuperview().offset(-Constants.lowOffset)
            make.width.equalTo(self.avatarImage.snp.height)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.avatarImage.snp.top).offset(Constants.lowOffset)
            make.leading.equalTo(self.avatarImage.snp.trailing).offset(Constants.offset)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.avatarImage.snp.trailing).offset(Constants.offset)
            make.bottom.equalTo(self.avatarImage.snp.bottom).offset(-Constants.lowOffset)
        }
        
        self.scoreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.avatarImage.snp.centerY)
            make.trailing.equalToSuperview().offset(-Constants.offset)
        }
    }
}
