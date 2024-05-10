//
//  TableViewController.swift
//  SimpleTodoList_Alert
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tvControl: UITableView!
    
    var itemList: [SavedData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        readValue()
    }
    // MARK: 데이터 리로드
    func  readValue(){
        let todoListDB = TodoListDB()
        itemList.removeAll()
        todoListDB.delegate = self
        todoListDB.queryDB()
        tvControl.reloadData()
    }
    // MARK: 데이터 추가 엑션 기능
    @IBAction func Alert(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "Todo  List", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        
        addAlert.addTextField{ACTION in
            ACTION.placeholder = "추가 내용"
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .default)
        let okAction = UIAlertAction(title: "추가", style: .default, handler: {ACTION in
            
            let todoListDB = TodoListDB()
          let result = todoListDB.insertDB(title: addAlert.textFields![0].text!)
            self.readValue()
            // Alert
                 if result{
                     let resultAlert = UIAlertController(title: "결과", message: "입력 되었습니다.", preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                        
                         self.navigationController?.popViewController(animated: true)
                     })
                     resultAlert.addAction(okAction)
                     self.present(resultAlert, animated: true)
                 }else{
                     let resultAlert = UIAlertController(title: "에러", message: "문제 발생.", preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                         self.navigationController?.popViewController(animated: true)
                     })
                     resultAlert.addAction(okAction)
                     self.present(resultAlert, animated: true)
                 }
            
            
         
            
        })
        addAlert.addAction(cancelAction)
        addAlert.addAction(okAction)
        
        present(addAlert,animated: true)
    }
    

    

    // MARK: 데이터 불러와 리스트 꾸미기
    
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
        content.text =  itemList[indexPath.row].title
      
        content.image = UIImage(systemName: "square.and.arrow.up.fill")
        
        cell.contentConfiguration = content
    
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // MARK: 셀 삭제 기능
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todoListDB = TodoListDB()
            _ = todoListDB.DeleteDB(id: itemList[indexPath.row].id)
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
// MARK: DB프로토콜 익스텐션
extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [SavedData]) {
        itemList = items
        tvControl.reloadData()
        
    }
    
  
}
