//
//  LoginViewController.swift
//  Twitter
//
//  Created by Priscila Almeida on 10/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
    }

    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        TwitterAPICaller.client?.login(url: myUrl, success: {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Fail to login")
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
