import UIKit



class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillLayoutSubviews()
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        
        profileHeader.frame = view.bounds
        
        view.addSubview(profileHeader)
        
    }
}
