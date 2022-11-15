import UIKit

class ProfileHeaderView: UIView {
    var profilePic: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        profilePic = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        profilePic.image = UIImage(named: "image")
        profilePic.backgroundColor = .cyan
        self.addSubview(profilePic)
        
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
