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
    
    var stackForLogin: UIStackView = {
        let stack = UIStackView()
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.backgroundColor = .systemGray6
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
        
    var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logInTextField: UITextField = {
        let logIn = UITextField()
        logIn.backgroundColor = .systemGray6
        logIn.textColor = .black
        logIn.font = .systemFont(ofSize: 16)
        logIn.textAlignment = .left
        logIn.placeholder = "   Email or phone"
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
        password.placeholder = "    Password"
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
        scrollView.keyboardDismissMode = .onDrag
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
        contentView.addSubview(stackForLogin)
        contentView.addSubview(logInTextField)
        contentView.addSubview(passwordTextField)
        stackForLogin.addSubview(separatorView)
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
            
            stackForLogin.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackForLogin.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            stackForLogin.heightAnchor.constraint(equalToConstant: 100),
            stackForLogin.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            
            logInTextField.centerXAnchor.constraint(equalTo: stackForLogin.centerXAnchor),
            logInTextField.widthAnchor.constraint(equalTo: stackForLogin.widthAnchor, constant: -20),
            logInTextField.heightAnchor.constraint(equalToConstant: 48),
            logInTextField.topAnchor.constraint(equalTo: stackForLogin.topAnchor, constant: 1),
            
            separatorView.centerXAnchor.constraint(equalTo: stackForLogin.centerXAnchor),
            separatorView.widthAnchor.constraint(equalTo: stackForLogin.widthAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            
            passwordTextField.centerXAnchor.constraint(equalTo: stackForLogin.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: stackForLogin.widthAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor, constant: 1),
            
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
