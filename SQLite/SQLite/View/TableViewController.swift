//
//  TableViewController.swift
//  SQLite
//
//  Created by TJ on 2024/05/07.
//

import UIKit

class TableViewController: UITableViewController {

   
    @IBOutlet var tvTableView: UITableView!
    
    var studentList: [Students] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
 
    override func viewWillAppear(_ animated: Bool) {
        readValues()
        
    }
    
    func readValues(){
        let studentDB = StudentsDB()
        studentList.removeAll()
        studentDB.delegate = self
        studentDB.queryDB()
        tvTableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
                
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "학번: \(studentList[indexPath.row].id)"
        content.secondaryText = "성명 : \(studentList[indexPath.row].name)"
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
            studentList.remove(at: indexPath.row)
                       tableView.deleteRows(at: [indexPath], with: .fade)
            // Delete the row from the data source
       
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
        if segue.identifier == "GoDetail"{
                 // 해당 셀의 번호 찾기
                 let cell = sender as! UITableViewCell
                 let indexPath = tvTableView.indexPath(for: cell)
                 // 디테일 뷰의 사용 권한을 받고 디테일뷰의 recive 변수에 내가 선택한 값을 넣는다
                 let detailView = segue.destination as! DetailViewController
            detailView.id = studentList[indexPath!.row].id
            detailView.name = studentList[indexPath!.row].name
            detailView.dept = studentList[indexPath!.row].dept
            detailView.phone = studentList[indexPath!.row].phone
            
             }
    }
    

}


extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [Students]) {
        studentList = items
        tvTableView.reloadData()
        
    }
    
  
}
