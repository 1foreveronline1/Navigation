import UIKit

class LogInViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var vkLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "Logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    var logInTextField: UITextField = {
        let logIn = UITextField()
        logIn.backgroundColor = .systemGray6
        logIn.textColor = .black
        logIn.font = .systemFont(ofSize: 16)
        logIn.textAlignment = .left
        logIn.layer.cornerRadius = 10
        logIn.layer.borderWidth = 0.5
        logIn.placeholder = "   Email or phone"
        logIn.layer.borderColor = UIColor.lightGray.cgColor
        logIn.autocapitalizationType = .none
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
    }()
    
    var passwordTextField: UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.font = .systemFont(ofSize: 16)
        password.textAlignment = .left
        password.layer.cornerRadius = 10
        password.layer.borderWidth = 0.5
        password.placeholder = "    Password"
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "VKColor")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .selected)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .highlighted)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .disabled)
        button.addTarget(Any?.self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        addSubviews()
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
       
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkLogo)
        contentView.addSubview(logInTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 900),
            
            vkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            
            logInTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            logInTextField.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            
            
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16)
        ])
    }
        
    @objc func buttonAction() {
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
        
        
    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentOffset = CGPoint(x: 0, y: ks.height - self.view.safeAreaInsets.bottom)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.scrollView.contentOffset = .zero
    }
}
