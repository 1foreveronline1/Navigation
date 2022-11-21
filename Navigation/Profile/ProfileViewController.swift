import UIKit



class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()
    
    var buttonTitleChange: UIButton = {
        let buttonForTitle = UIButton()
        buttonForTitle.backgroundColor = .systemBlue
        buttonForTitle.setTitle("Сменить имя", for: .normal)
        buttonForTitle.setTitleColor(UIColor.white, for: .normal)
        buttonForTitle.layer.cornerRadius = 4
        buttonForTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonForTitle.layer.shadowRadius = 4
        buttonForTitle.layer.shadowColor = UIColor.black.cgColor
        buttonForTitle.layer.shadowOpacity = 0.7
        buttonForTitle.layer.masksToBounds = false
        buttonForTitle.addTarget(Any?.self, action: #selector(titleChange), for: .touchUpInside)
        buttonForTitle.translatesAutoresizingMaskIntoConstraints = false
        return buttonForTitle
    }()
    
    @objc func titleChange() {
            profileHeader.fullNameLabel.text = "Крутой кот"
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        setupView()
    }
    
    func setupView() {
            profileHeader.backgroundColor = .systemGray
            view.addSubview(profileHeader)
            profileHeader.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(buttonTitleChange)
            let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileHeader.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
                
            buttonTitleChange.heightAnchor.constraint(equalToConstant: 50),
            buttonTitleChange.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            buttonTitleChange.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            buttonTitleChange.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            profileHeader.frame = view.bounds
        }
    
}
