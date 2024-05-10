//
//  TableViewController.swift
//  FirebaseImageAddress
//
//  Created by 김수진 on 5/10/24.
//

import UIKit
import FirebaseStorage // <<< 이미지를 가져오기 위해 임포트해줘야해요.

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var addressStore: [DBModel] = []
    
    
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
        return addressStore.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell    // 우리가 정의한 셀을 사용하기 위해 as! 해줘야함.
        
        cell.lblName.text = addressStore[indexPath.row].name
        cell.lblPhone.text  = addressStore[indexPath.row].phone
        
        let storage = Storage.storage()
        let httpReference = storage.reference(forURL: addressStore[indexPath.row].image)

        httpReference.getData(maxSize: 1*1024*1024, completion: {
            data, error in
            if let error = error{
                print("Error : \(error)")
            }else{
                cell.imgView.image = UIImage(data: data!)   // data는 이미지를 가져올때, name은 파일명으로 된 이미지를 가져올때.
            }
        })
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}   // TableViewController

extension TableViewController: QueryModelProtocol{
    func itemDownLoaded(items: [DBModel]) {
        addressStore = items
        self.listTableView.reloadData() // 어떤것이 먼저 올지 몰라서 리로드해줌.
    }
}
