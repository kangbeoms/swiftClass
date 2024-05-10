//
//  TableViewController.swift
//  Table_control_Quiz
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tvtableList: UITableView!
    //var imageName = ["bee.png","cat.png","cow.png","dog.png","fox.png","monkey.png","pig.png","wolf.png"]
    
    var ListData: [SaveData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddList()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func AddList(){
                        ListData.append(SaveData(name: "벌", image: "bee.png", whatKind: "곤충"))
                        ListData.append(SaveData(name: "고양이", image: "cat.png", whatKind: "포유류"))
                        ListData.append(SaveData(name: "소", image: "cow.png", whatKind: "포유류"))
                        ListData.append(SaveData(name: "개", image: "dog.png", whatKind: "포유류" ))
                        ListData.append(SaveData(name: "여우", image: "fox.png", whatKind: "포유류" ))
                        ListData.append(SaveData(name: "원숭이", image: "monkey.png" , whatKind: "영장류"))
                        ListData.append(SaveData(name: "돼지", image: "pig.png", whatKind: "영장류"))
                        ListData.append(SaveData(name: "늑대", image: "wolf.png", whatKind: "포유류"))
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
                            return ListData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
            var content = cell.defaultContentConfiguration()
            content.text = ListData[indexPath.row].name
            content.image = UIImage(named: ListData[indexPath.row].image)
                            
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
            ListData.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item 의 복사
        let itemToMove = ListData[fromIndexPath.row]
        // 이동할 item의 삭제
        ListData.remove(at: fromIndexPath.row)
        // 이동할 위치에 insert
        ListData.insert(itemToMove, at: to.row)
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
        // Pass the selected object to the new view controller.
        if segue.identifier == "GoDetail"{
            // 해당 셀의 번호 찾기
            let cell = sender as! UITableViewCell
            let indexPath = tvtableList.indexPath(for: cell)
            // 디테일 뷰의 사용 권한을 받고 디테일뷰의 recive 변수에 내가 선택한 값을 넣는다
            let detailView = segue.destination as! DetailViewController
            detailView.result = ListData[indexPath!.row].name
            detailView.image = ListData[indexPath!.row].image
            detailView.whatKind = ListData[indexPath!.row].whatKind
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
