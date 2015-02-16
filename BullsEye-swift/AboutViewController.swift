//
//  AboutViewController.swift
//  BullsEye-swift
//
//  Created by Michael Henry on 2/12/15.
//  Copyright (c) 2015 Digital Javelina, LLC. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var webView: UIWebView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
