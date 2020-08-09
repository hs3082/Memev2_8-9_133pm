//
//  SentMemesTableViewController.swift
//  MemeMe v1
//
//  Created by Howard Snyder on 7/28/20.
//  Copyright © 2020 Howard Snyder. All rights reserved.
//

//import Foundation
import UIKit

class SentMemesTableViewController: UITableViewController {

    ////////////////////////////updated - added lines 20-22  based on advice from mentor - Vivek M
    var memes: [Meme] {
            return (UIApplication.shared.delegate as! AppDelegate).memes
    }
//////////////////////////// end of updated based on advice from mentor - Vivek M
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Meme", style: .plain, target: self, action: #selector(addMeme))
        
        //tableView.delegate = self
        
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = false
            
            print("Table View will Load")
            
            // create an IBOutlet for the table view first
            // then reload the tableview in viewWillAppear instead of viewDidLoad
            tableView.reloadData()
            
        }
    
    @objc func addMeme() {
    let controller = (storyboard?.instantiateViewController(identifier: "MemeEditorViewController"))!
    present(controller, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return number of memes in array
        
        if memes == nil
        {
            print("No memes to show")
            return 0
        }
        
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // 1. Dequeue a reusable cell from the table, using the correct “reuse identifier” MemeCell
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!

        // 2. Find the model object that corresponds to that row
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // 3. Set the images and labels in the cell with the data from the model object
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        
        // If the cell has a detail label, we will put the evil scheme in.
        
        
        // 4. return the cell.
        return cell

    }
    
    /////////////////////////////////////// Updated to override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  Per Mentor Spiros R Aug 8th ////////////////////
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Instantiate detailed view controller from storyboard
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        // Set villain property
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Pass to next screen
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
}





