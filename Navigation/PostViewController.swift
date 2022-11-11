import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Не пост"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(newButtonAction))


        
    }
    @objc private func newButtonAction() {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .popover
        self.present(infoViewController, animated: true)


    }
    


    
    


}
