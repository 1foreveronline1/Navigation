import UIKit

class PhotoDisplayViewController: UIViewController {

    var indexPhotoRow: Int!

    lazy var photo: UIImageView = {
        let imagePhoto = UIImageView()
        imagePhoto.clipsToBounds = true
        imagePhoto.contentMode = .scaleAspectFit
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        imagePhoto.image = UIImage(named: photoGallery[indexPhotoRow].image)
        return imagePhoto
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closePhoto), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .black

        self.view.addSubview(closeButton)
        self.view.addSubview(photo)

        UIView.animate(withDuration: 0.7, delay: 0.2) {
            NSLayoutConstraint.activate([
                self.photo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.photo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.photo.heightAnchor.constraint(equalToConstant: 500),
                self.photo.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
            self.photo.layoutIfNeeded()
        }

        UIView.animate(withDuration: 0.3, delay: 0.8) {
            NSLayoutConstraint.activate([
                self.closeButton.bottomAnchor.constraint(equalTo: self.photo.topAnchor, constant: -5),
                self.closeButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
                self.closeButton.heightAnchor.constraint(equalToConstant: 50),
                self.closeButton.widthAnchor.constraint(equalToConstant: 50)
            ])
            self.closeButton.layoutIfNeeded()
        }
    }

    @objc func closePhoto() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: nil)
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}
