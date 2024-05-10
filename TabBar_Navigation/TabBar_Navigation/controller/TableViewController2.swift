//
//  TableViewController.swift
//  TableView_Quiz
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class TableViewController2: UITableViewController {

    var ListArray: [SavedData] = []

    var text = ""
    var image = ""
    var state = ""
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fillList()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    

    
    // MARK: 데이터 리스트 생성
    func fillList(){
        ListArray.append(SavedData(title: "책 구매", image: "naver_29.png"))
        ListArray.append(SavedData(title: "약속", image: "google_29.png"))
        ListArray.append(SavedData(title: "스터디", image: "daum_29.png"))
        //ListArray.append(TableView_Quiz.SavedData(title: "책 구매", image: "naver_29.png"))
    }
    
    //MARK: 화면을 다시 불러 올 때 리스트 새로고침 & 추가
    override func viewWillAppear(_ animated: Bool) {
        appendData()
        // 화면이 실행될떄 시작 함수 모두 시작
        tvListView.reloadData()
    }
    
    
    
    
    func appendData(){
        if state == "new"{
            ListArray.append(SavedData(title: DataToInsert.Message, image: DataToInsert.image))
            DataToInsert.dataState = "old"
        }
    }
    
    
   
    // MARK: 테이블 구성과 셀 생성 함수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ListArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = ListArray[indexPath.row].title
        content.image = UIImage(named: ListArray[indexPath.row].image)
        
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
    // MARK: 테이블 셀 삭제 함수
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ListArray.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }


    // MARK: 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item 의 복사
        let itemToMove = ListArray[fromIndexPath.row]
        // 이동할 item의 삭제
        ListArray.remove(at: fromIndexPath.row)
        // 이동할 위치에 insert
        ListArray.insert(itemToMove, at: to.row)
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
        if segue.identifier == "GoDetail"{
            // 해당 셀의 번호 찾기
            let cell = sender as! UITableViewCell
            let indexPath = tvListView.indexPath(for: cell)
            // 디테일 뷰의 사용 권한을 받고 디테일뷰의 recive 변수에 내가 선택한 값을 넣는다
            let detailView = segue.destination as! DetailViewController2
            detailView.text = ListArray[indexPath!.row].title
            detailView.image = ListArray[indexPath!.row].image
        }
    }
    

}


//extension TableViewController: SavedData{
//    func SavedData(_ controller: AddViewController, dataState: String, Message: String, image: String){
//
//    }
//}
