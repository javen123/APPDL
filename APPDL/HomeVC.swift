//
//  HomeVC.swift
//  APPDL
//
//  Created by Jim Aven on 6/6/16.
//  Copyright © 2016 JIm Aven. All rights reserved.
//

import UIKit
import CoreData

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    let navView = UIView()
    let cellID = "cell"
    
    var views = [String:AnyObject]()
    var constraints = [NSLayoutConstraint]()
    var tableView = UITableView()
    var fetchedResultsController:NSFetchedResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptFetch()
        setupTableView()
        setupConstraints()
        
    }
    
    //MARK:TABLE VIEW DELEGATES
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sections = fetchedResultsController.sections as [NSFetchedResultsSectionInfo]!
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? CustomCell {
            
            configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DetailsVC()
        let user = fetchedResultsController.objectAtIndexPath(indexPath) as! Client
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: COREDATA FETCH FUNCS
    
    func attemptFetch() {
        let request = NSFetchRequest(entityName: "Client")
        let sortDescriptor = NSSortDescriptor(key: "username", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: ad.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        fetchedResultsController = controller
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("Fetch error:\(error.localizedDescription)")
        }
        
        if controller.fetchedObjects?.count == 0 {
            Download.dl.fetch("users", completed: {
                success in
                if success {
                    print("items downloaded from URL")
                }
            })
        }
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Move:
            break
        case .Update:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case .Update:
            let cell = tableView.cellForRowAtIndexPath(indexPath!) as! CustomCell
            configureCell(cell, indexPath: indexPath!)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            tableView.insertRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        }    }
    // MARK: HELPERS
    
    func setupTableView() {
        
        tableView.registerClass(CustomCell.self, forCellReuseIdentifier: cellID)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
    }
    
    func setupConstraints() {
        
        // TABLE VIEW
        views["tableView"] = tableView
        addConstraint("V:|-10-[tableView]-10-|")
        addConstraint("H:|-0-[tableView]-0-|")
        
        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    func configureCell(cell:CustomCell, indexPath:NSIndexPath) {
        if let record = fetchedResultsController.objectAtIndexPath(indexPath) as? Client {
            cell.setUpCell(record)
        }
    }
    
    func addConstraint(format:String) {
        let navViewVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        constraints += navViewVerticalConstraints
    }
    
}

