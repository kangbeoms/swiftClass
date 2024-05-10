//
//  TableViewController.swift
//  TableView
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    var dataArray:[TodoList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // Edit 버튼을 만들고 삭제 기능 추가하기
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    func dataInit(){
        dataArray.append(TodoList(items: "책 구매", itemsImageFile: "naver_29.png"))
        dataArray.append(TodoList(items: "철수와 약속", itemsImageFile: "daum_29.png"))
        dataArray.append(TodoList(items: "스터디 준비하기", itemsImageFile: "google_29.png"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appendData()
        // 화면이 실행될떄 시작 함수 모두 시작
        tvListView.reloadData()
    }
    
    func appendData(){
        if Message.check == "new"{
            dataArray.append(TodoList(items: Message.item, itemsImageFile: Message.itemImage))
            Message.check = "old"
        }
    }
    
    // MARK: - Table view data source
    // Section 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // Section당 Row 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

         //Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = dataArray[indexPath.row].items
        content.image = UIImage(named: dataArray[indexPath.row].itemsImageFile)
        
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

    // Table Cell 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    // 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item 의 복사
        let itemToMove = dataArray[fromIndexPath.row]
        // 이동할 item의 삭제
        dataArray.remove(at: fromIndexPath.row)
        // 이동할 위치에 insert
        dataArray.insert(itemToMove, at: to.row)
    }
    

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
        if segue.identifier == "cellDetail"{
            // 해당 셀의 번호 찾기
            let cell = sender as! UITableViewCell
            let indexPath = tvListView.indexPath(for: cell)
            // 디테일 뷰의 사용 권한을 받고 디테일뷰의 recive 변수에 내가 선택한 값을 넣는다
            let detailView = segue.destination as! DetailViewController
            detailView.recive = dataArray[indexPath!.row].items
        }
    }
}
