import UIKit

class ProfileHeaderView: UIView {
        
    let profileView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let avatarImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "Image")
        picture.clipsToBounds = true
        picture.layer.borderWidth = 3
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.cornerRadius = 50
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()
    
    let fullNameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.text = "Кот с цепью"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let statusLabel: UILabel = {
        let status = UILabel()
        status.textAlignment = .left
        status.font = UIFont.systemFont(ofSize: 14)
        status.text = "Крутой блин..."
        status.textColor = .gray
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()

    let statusTextField: UITextField = {
       let text = UITextField ()
       text.backgroundColor = .white
       text.font = .systemFont(ofSize: 15, weight: .regular)
       text.textColor = .black
       text.layer.cornerRadius = 12
       text.borderStyle = .roundedRect
       text.layer.borderWidth = 1
       text.clipsToBounds = true
       text.placeholder = "Ваш статус..."
       text.keyboardType = .default
       text.clearButtonMode = .whileEditing
       text.contentHorizontalAlignment = .center
       text.returnKeyType = .done
       text.addTarget(Any?.self, action: #selector(statusTextChanged), for: .editingChanged)
       text.translatesAutoresizingMaskIntoConstraints = false
       return text
   }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(Any?.self, action: #selector(statButAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileView)
        addViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
    }
    
    func setupView() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileView.widthAnchor.constraint(equalTo: self.widthAnchor),
            profileView.topAnchor.constraint(equalTo: safeArea.topAnchor),
                
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
                
            fullNameLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 150),
                
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.widthAnchor.constraint(equalTo: profileView.widthAnchor, constant: -32),
            setStatusButton.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 160),
            setStatusButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
                
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 150),
                
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
        ])
    }
    
    @objc func statButAction() {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
            statusText = textField.text ?? ""
            }
    
}
