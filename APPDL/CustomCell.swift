//
//  CustomCell.swift
//  APPDL
//
//  Created by JIm Aven on 6/6/16.
//  Copyright © 2016 JIm Aven. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var lblName = UILabel()
    var lblCompany = UILabel()
    var lblWeb = UILabel()
    
    var views = [String:AnyObject]()
    var viewCons = [NSLayoutConstraint]()
    
    func setUpCell(user:Client) {
        
        backgroundColor = UIColor.whiteColor()
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSizeMake(0,3)
        layer.shadowOpacity = 0.5
        setNeedsLayout()
        
        lblName.textColor = UIColor.darkGrayColor()
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.text = user.username!
        
        lblWeb.textColor = UIColor.darkGrayColor()
        lblWeb.font = UIFont(name: "Helvetica", size: 24.0)
        lblWeb.translatesAutoresizingMaskIntoConstraints = false
        lblWeb.text = user.website
        
        addSubview(lblName)
        addSubview(lblWeb)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        //NAME LABEL
        views["lblName"] = lblName
        addCons("H:|-10-[lblName(100@750)]")
        addCons("V:|-5-[lblName(35@750)]")
        
        //Web LABEL
        views["lblWeb"] = lblWeb
        addCons("H:[lblWeb]->=10-|")
        addCons("V:|-5-[lblWeb(35@750)]|")
        NSLayoutConstraint.activateConstraints(viewCons)
        
    }
    
    func addCons(format:String) {
        let newCons = NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        viewCons += newCons
    }

}
