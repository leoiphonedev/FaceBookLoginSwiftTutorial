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
                //self.getUserProfile()
            }
        }
    }
    
    
   /* func getUserProfile() {
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/me", parameters: ["fields" : "id,name,about,birthday"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: )) {
            response, result in
            switch result {
            case .success(let response):
                print("Logged in user facebook id == \(String(describing: response.dictionaryValue!["id"]))")
                print("Logged in user facebook Name == \(String(describing: response.dictionaryValue!["name"]))")
                break
            case .failed(let error):
                print("We havw error fetching loggedin user profile ==\(error.localizedDescription)")
            }
        }
        connection.start()
    }*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

