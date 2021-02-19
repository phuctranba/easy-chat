//
//  ConversationTableViewCell.swift
//  Easy Chat
//
//  Created by ZipEnter on 18/02/2021.
//

import UIKit
import SDWebImage

class ConversationTableViewCell: UITableViewCell {
    
    static let identifier = "ConversationTableViewCell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let userMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userMessageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.frame = CGRect(x: 15,
                                     y: 10,
                                     width: 60,
                                     height: 60)
        
        userNameLabel.frame = CGRect(x: userImageView.right + 15,
                                     y: 10,
                                     width: contentView.width - 20 - userImageView.width,
                                     height: (contentView.height-40)/2)
        
        userMessageLabel.frame = CGRect(x: userImageView.right + 15,
                                        y: userNameLabel.bottom + 5,
                                        width: contentView.width - 20 - userImageView.width,
                                        height: ((contentView.height-40)/2) + 20)
        
    }
    
    public func configure(with model: Conversation) {
        userMessageLabel.text = model.latestMessage.text
        userNameLabel.text = model.name
        
        let path = "images/\(model.otherUserEmail)_profile_picture.png"
        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
            switch result {
            case .success(let url):
                
                DispatchQueue.main.async {
                    self?.userImageView.sd_setImage(with: url, completed: nil)
                }
                
            case .failure(let error):
                print("failed to get image url: \(error)")
            }
        })
    }
    
}
