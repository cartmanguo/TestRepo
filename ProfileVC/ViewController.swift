//
//  ViewController.swift
//  ProfileVC
//
//  Created by randy on 15/7/13.
//  Copyright (c) 2015年 randy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UIScrollViewDelegate {
    var header:MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        header = NSBundle.mainBundle().loadNibNamed("View", owner: self, options: nil).first as! MyView
        tableView.addSubview(header)
        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Cell") as? UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = "123"
        return cell!
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset  = scrollView.contentOffset.y
        println(yOffset)
        let delta = 8.0/(-200)
        if (yOffset < -200 && yOffset > -360)
        {
            var f = self.header.frame;
            f.origin.y = yOffset;
            f.size.height =  -yOffset;
            self.header.frame = f;
        }
        else if yOffset <= -360
        {
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

