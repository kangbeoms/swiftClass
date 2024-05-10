//
//  TableViewController.swift
//  FirebaseList
//
//  Created by TJ on 2024/05/09.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var TableList: UITableView!
    
    var studentStore: [DBModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadAction()
    }
    
    func reloadAction(){
        var queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentStore.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "성명 : \(studentStore[indexPath.row].name)"
        content.secondaryText = "학번 : \(studentStore[indexPath.row].code)"
        cell.contentConfiguration = content
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            studentStore.remove(at: indexPath.row)
            var delete = DeleteModel()
            let del =   delete.deleteItems(documentId: studentStore[indexPath.row].documentId)
           
           
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            TableList.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "GoDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.TableList.indexPath(for: cell)
            
            Message.documentId = studentStore[indexPath!.row].documentId
            Message.code = studentStore[indexPath!.row].code
            Message.name = studentStore[indexPath!.row].name
            Message.dept = studentStore[indexPath!.row].dept
            Message.phone = studentStore[indexPath!.row].phone
        }
        
    }
    

}

extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [DBModel]) {
        studentStore = items
        self.TableList.reloadData()
    }
    
    
}


