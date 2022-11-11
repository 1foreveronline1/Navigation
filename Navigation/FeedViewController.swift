import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
          button.center = view.center
          button.backgroundColor = .white
          button.setTitle("Мой пост", for: .normal)
          button.setTitleColor(.black, for: .normal)
          button.layer.cornerRadius = 12
          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

          self.view.addSubview(button)
        
        
    }
    
    var post = Post(title: "Мой новый пост")
    
    @objc private func buttonAction() {
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
    
    
}
