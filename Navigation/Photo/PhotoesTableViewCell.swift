import UIKit

class PhotoesTableViewCell: UITableViewCell {

    var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Фотографии"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var arrowButton: UIButton = {
        let arrow = UIButton()
        arrow.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    var firstPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo1")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var secondPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo2")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var thirdPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo3")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
     
    var fourthPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo4")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var photoStackView: UIStackView = {
        let photoSV = UIStackView()
        photoSV.axis = .horizontal
        photoSV.distribution = .fillEqually
        photoSV.spacing = 8
        photoSV.translatesAutoresizingMaskIntoConstraints = false
        return photoSV
    }()
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        photoStackView.addArrangedSubview(firstPhoto)
        photoStackView.addArrangedSubview(secondPhoto)
        photoStackView.addArrangedSubview(thirdPhoto)
        photoStackView.addArrangedSubview(fourthPhoto)
        
        contentView.addSubview(photoLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(photoStackView)
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photoStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoStackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24),
            photoStackView.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor)
        ])
    }
}
