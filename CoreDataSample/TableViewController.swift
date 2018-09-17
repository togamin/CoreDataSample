//
//  TableViewController.swift
//  CoreDataSample
//
//  Created by Togami Yuki on 2018/09/17.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        

        return cell
    }
    //追加ボタン
    @IBAction func AddQuestion(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "質問を登録しますか？", message:nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
            //OKボタンを押したときの処理。
            //CoreDataに登録
            
            //CoreDataから再びデータを読み込む
            
            //TableViewのリロード
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
        //アラートにテキスト追加
        alert.addTextField { textField -> Void in
            textField.placeholder = "質問を追加"
        }
        alert.addTextField { textField -> Void in
            textField.placeholder = "メモ"
        }
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        present(alert,animated: true,completion: {()->Void in print("表示")})
    }
}
