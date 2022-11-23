import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func createFirstController() -> UINavigationController{
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        feedVC.title = "Лента"
        feedVC.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return feedVC
    }
    func createSecondController() -> UINavigationController{
        let logInVC = UINavigationController(rootViewController: LogInViewController())
        logInVC.title = "Профиль"
        logInVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return logInVC
    }
    func createTabBar() -> UITabBarController{
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .white
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        return tabBar
    }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()
        self.window = window
    }
    func sceneDidDisconnect(_ scene: UIScene) {

    }
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    func sceneWillResignActive(_ scene: UIScene) {

    }
    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }
}

