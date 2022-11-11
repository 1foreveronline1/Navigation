import UIKit

class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    let thirdButton = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        thirdButton.center = view.center
        thirdButton.backgroundColor = .white
        thirdButton.setTitle("Скачать пост", for: .normal)
        thirdButton.setTitleColor(.black, for: .normal)
        thirdButton.layer.cornerRadius = 12
        thirdButton.addTarget(self, action: #selector(thirdButtonAction), for: .touchUpInside)
        self.view.addSubview(thirdButton)
    }
    @objc private func thirdButtonAction(){
        let alert = UIAlertController(title: "Вы хотите загрузить пост?", message: "Это займет 14,2 Мб памяти", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            print("Пост был загружен")
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in
            print("Загрузка отменена")
        }))
        self.present(alert, animated: true)
    }
}
