//
//  TableViewController.swift
//  SimpleTodoList_Alert
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tvControl: UITableView!
    
    var itemList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        addList()
        //appendData()
        // 화면이 실행될떄 시작 함수 모두 시작
        // itemList.reloadData()
    }
    
    @IBAction func Alert(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "Todo  List", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        
        addAlert.addTextField{ACTION in
            ACTION.placeholder = "추가 내용"
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .default)
        let okAction = UIAlertAction(title: "추가", style: .default, handler: {ACTION in
            
            self.itemList.append(addAlert.textFields![0].text!)
            self.tvControl.reloadData()
            
        })
        addAlert.addAction(cancelAction)
        addAlert.addAction(okAction)
        
        present(addAlert,animated: true)
    }
    

    
    func addList(){
        itemList.append("꽃산물 준비")
        itemList.append("공기 청정기 필터 교체")
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = itemList[indexPath.row]
        content.image = UIImage(systemName: "square.and.arrow.up.fill")
        //content.image
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }
    }
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
        
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
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
