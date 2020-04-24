//
//  ViewController.swift
//  FacebookLogin-Swift
//
//  Created by Aman Aggarwal on 08/10/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginWithFacebook(_ sender: Any) {
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
            case .cancelled:
                print("User cancelled login process")
                break
            case .failed(let error) :
                print("Login failed with error = \(error.localizedDescription)")
                break
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                
                print("access token == \(accessToken)")
                self.getUserProfile()
            }
        }
    }
    
    
    func getUserProfile() {
        //695607970815288
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/me", parameters: ["fields" : "id,name,about,birthday"], httpMethod: .get)) { (connection, response, error) in
            if let error = error {
                print("Error getting user info = \(error.localizedDescription)")
            } else {
                guard let userInfo = response as? Dictionary<String,Any> else {
                    return
                }
                
                if let userID = userInfo["id"] as? String {
                    print("Logged in user facebook id == \(userID)")
                    
                }
                
                if let userName = userInfo["name"] as? String {
                    print("Logged in user facebook name == \(userName)")
                    
                }
                
            }
        }
        connection.start()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

