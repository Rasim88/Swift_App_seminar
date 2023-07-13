import UIKit

class ViewController: UIViewController {
    
    private var imageView = UIImageView(image: UIImage(named: "profil-mordy-tigra-vo-tme.jpg"))
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Mate", size: 24)
        return label
    }()
    
    private var loginField: UITextField = {
        let login = UITextField()
        login.borderStyle = .line
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.black.cgColor
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 22)
        let placeholderText = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        login.attributedPlaceholder = placeholderText
        return login
    }()
    private var passwordField: UITextField = {
        let password = UITextField()
        password.borderStyle = .line
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 22)
        let placeholderText = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        password.attributedPlaceholder = placeholderText
        return password
    }()
    
    private var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        enterButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        setupViews()
        
    }
    
    private func setupViews(){
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(enterButton)
        setupConstraints()
    }
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([imageView.widthAnchor.constraint(equalToConstant: 150),
                                     imageView.heightAnchor.constraint(equalToConstant: 150),
                                     imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
                                     label.heightAnchor.constraint(equalToConstant: 100),
                                     label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                     loginField.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 30),
                                     loginField.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -30),
                                     loginField.heightAnchor.constraint(equalToConstant:50),
                                     loginField.topAnchor.constraint(equalTo:imageView.bottomAnchor, constant: 60),
                                     passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     passwordField.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -30),
                                     passwordField.heightAnchor.constraint(equalToConstant: 50),
                                     passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 30),
                                     enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     enterButton.heightAnchor.constraint(equalToConstant: 50),
                                     enterButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 50)])
    }
        

    
    @objc private func tap(){
        
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotoViewController(collectionViewLayout: UICollectionViewFlowLayout()))
                                          
                                          tab1.tabBarItem.title = "Friends"
                                          tab2.tabBarItem.title = "Groups"
                                          tab3.tabBarItem.title = "Photo"
                                          
                                          let controllers = [tab1, tab2, tab3]
                                          
                                          let tabBarController = UITabBarController()
                                          tabBarController.viewControllers = controllers
        navigationController?.pushViewController(tabBarController, animated: true)
                                          guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let firstWindow = firstScene.windows.first else {
            return
        }
        firstWindow.rootViewController = tabBarController
    }
    
}
