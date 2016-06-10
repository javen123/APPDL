//
//  DetailsVC.swift
//  APPDL
//
//  Created by Jim Aven on 6/8/16.
//  Copyright © 2016 JIm Aven. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    var views = [String:AnyObject]()
    var constraints = [NSLayoutConstraint]()
    
    var lblName = UILabel()
    var lblEmail = UILabel()
    var lblWebsite = UILabel()
    var lblUsername = UILabel()
    var lblPhone = UILabel()
    var lblId = UILabel()
    var lblStreet = UILabel()
    var lblSuite = UILabel()
    var lblCity = UILabel()
    var lblZip = UILabel()
    var lblLat = UILabel()
    var lblLng = UILabel()
    var lblCoBS = UILabel()
    var lblCoCatchPhrase = UILabel()
    var lblCoName = UILabel()
    
    var collectionLabels:[UILabel]!
    
    var address = UIView()
    
    var user:Client!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionLabels = [lblName,lblEmail, lblPhone,lblWebsite,lblUsername, lblId,lblStreet,lblSuite,lblCity,lblZip,lblZip,lblLat,lblLng,lblCoBS,lblCoCatchPhrase,lblCoName]
        
        self.view.backgroundColor = UIColor.whiteColor()

        setupLabels(user)
        setupConstraints()
        
        NSLayoutConstraint.activateConstraints(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLabels(user:Client) {
        
        lblName.text = user.fullname!
        lblEmail.text = user.email!
        lblWebsite.text = user.website!
        lblUsername.text = user.username!
        lblPhone.text = user.phone!
        lblId.text = String(user.id!)
        lblStreet.text = user.address?.street!
        lblSuite.text = user.address?.suite!
        lblCity.text = user.address?.city!
        lblZip.text = user.address?.zip!
        lblLat.text = user.address?.lat!
        lblLng.text = user.address?.lng!
        lblCoBS.text = user.company?.bs
        lblCoCatchPhrase.text = user.company?.catchPhrase!
        lblCoName.text = user.company?.name!
        
        for x in collectionLabels {
            x.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(x)
        }
        
    }
    
    func setupConstraints() {
        
        views["lblName"] = lblName
        views["lblUsername"] = lblUsername
        views["lblEmail"] = lblEmail
        views["lblPhone"] = lblPhone
        views["lblWebsite"] = lblWebsite
        views["lblId"] = lblId
        views["lblStreet"] = lblStreet
        views["lblSuite"] = lblSuite
        views["lblCity"] = lblCity
        views["lblZip"] = lblZip
        views["lblLat"] = lblLat
        views["lblLng"] = lblLng
        views["lblCoBs"] = lblCoBS
        views["lblCoCatch"] = lblCoCatchPhrase
        views["lblCoName"] = lblCoName
        
        //NAME LABEL
        addConstraint("H:|-10-[lblName]")
        addConstraint("V:|-80-[lblName]-15-[lblUsername]")
        
        //USERNAME LABEL
        addConstraint("H:|-10-[lblUsername]")
        addConstraint("V:[lblUsername]-15-[lblEmail]")
        
        //EMAIL LABEL
        addConstraint("H:|-10-[lblEmail]")
        addConstraint("V:[lblEmail]-15-[lblPhone]")
        
        //PHONE LABEL
        addConstraint("H:|-10-[lblPhone]")
        addConstraint("V:[lblPhone]-15-[lblWebsite]")
        
        //WEBSITE LABEL
        addConstraint("H:|-10-[lblWebsite]")
        addConstraint("V:[lblWebsite]-15-[lblId]")
        
        //ID LABEL
        addConstraint("H:|-10-[lblId]")
        addConstraint("V:[lblId]-15-[lblStreet]")
        
        //STREET LABEL
        addConstraint("H:|-10-[lblStreet]")
        addConstraint("V:[lblStreet]-15-[lblSuite]")
        
        //SUITE LABEL
        addConstraint("H:|-10-[lblSuite]")
        addConstraint("V:[lblSuite]-15-[lblCity]")
        
        //CITY LABEL
        addConstraint("H:|-10-[lblCity]")
        addConstraint("V:[lblCity]-15-[lblZip]")
        
        //ZIP LABEL
        addConstraint("H:|-10-[lblZip]")
        addConstraint("V:[lblZip]-15-[lblLat]")
        
        //LATITUDE LABEL
        addConstraint("H:|-10-[lblLat]")
        addConstraint("V:[lblLat]-15-[lblLng]")
        
        //LONGITUDE LABEL
        addConstraint("H:|-10-[lblLng]")
        addConstraint("V:[lblLng]-15-[lblCoName]")
        
        //COMPANY NAME
        addConstraint("H:|-10-[lblCoName]")
        addConstraint("V:[lblCoName]-15-[lblCoCatch]")
        
        //COMPANY CATCHPHRASE LABEL
        addConstraint("H:|-10-[lblCoCatch]-10-|")
        addConstraint("V:[lblCoCatch]-10-[lblCoBs]")
        
        //COMPANY BS
        addConstraint("H:|-10-[lblCoBs]")
        
    }
    
    
    func addConstraint(format:String) {
        let navViewVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        constraints += navViewVerticalConstraints
    }
}
