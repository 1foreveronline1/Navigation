import UIKit

class ProfileHeaderView: UIView {
    var newTitle: UILabel!
    var profilePic: UIImageView!
    var profileStat: UILabel!
    var profileName: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
        let rect = UIScreen.main.bounds

        
        newTitle = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 9))
        
        newTitle.font = UIFont.boldSystemFont(ofSize: 18)
        newTitle.textAlignment = .center
        newTitle.backgroundColor = .white
        self.addSubview(newTitle)
        
        profilePic = UIImageView(frame: CGRect(x: 16, y: rect.height / 9 + 16, width: 100, height: 100))
        profilePic.image = UIImage(named: "Image")
        profilePic.clipsToBounds = true
        profilePic.layer.borderWidth = 3
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.cornerRadius = 50
        self.addSubview(profilePic)
        
        profileName = UILabel(frame: CGRect(x: 132, y: rect.height / 9 + 27, width: 200, height: 18))
        profileName.textAlignment = .left
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        profileName.text = "Кот с цепью"
        self.addSubview(profileName)
        
        profileStat = UILabel(frame: CGRect(x: 132, y: rect.height / 9 + 84, width: 200, height: 14))
        profileStat.textAlignment = .left
        profileStat.font = UIFont.systemFont(ofSize: 14)
        profileStat.text = "Крутой блин..."
        profileStat.textColor = .gray
        self.addSubview(profileStat)
        
        let statBut = UIButton(frame: CGRect(x: 16, y: rect.height / 9 + 132, width: rect.width - 32, height: 50))
        statBut.setTitle("Show status", for: .normal)
        statBut.backgroundColor = .systemBlue
        statBut.layer.cornerRadius = 4
        statBut.setTitleColor(.white, for: .normal)
        statBut.layer.shadowOffset = .init(width: 4, height: 4)
        statBut.layer.shadowColor = UIColor.black.cgColor
        statBut.layer.shadowRadius = 4
        statBut.layer.shadowOpacity = 0.7
        statBut.addTarget(self, action: #selector(statButAction), for: .touchUpInside)
        self.addSubview(statBut)
        
       }
       
    @objc func statButAction() {
        var text: String
        text = profileStat.text!
        print(text)
    }
    
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
