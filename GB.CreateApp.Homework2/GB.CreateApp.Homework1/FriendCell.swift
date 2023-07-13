import UIKit

final class FriendCell: UITableViewCell{
    
    private var friendImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private var text: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implimented")
    }
    private func setupViews(){
        contentView.addSubview(friendImageView)
        contentView.addSubview(text)
        setupConstraints()
    }
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                                     friendImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor),
                                     friendImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                                     text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
                                     text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                    ])
        
    }
}

