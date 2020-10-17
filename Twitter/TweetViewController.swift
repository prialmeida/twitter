//
//  TweetViewController.swift
//  Twitter
//
//  Created by Priscila Almeida on 10/15/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
//, UITextFieldDelegate
class TweetViewController: UIViewController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetViewText.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Show keyboard by default
        tweetViewText.becomeFirstResponder()
    }
    
        
    @IBOutlet weak var tweetViewText: UITextView!
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetViewText.text.isEmpty){
            TwitterAPICaller.client?.postTweeet(tweetString: tweetViewText.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else{
            //can also put an alert controler asking for some text
            self.dismiss(animated: true, completion: nil)
        }
        
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
