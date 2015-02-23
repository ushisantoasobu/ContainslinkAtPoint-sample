//
//  ViewController.swift
//  ContainslinkAtPoint
//
//  Created by SatoShunsuke on 2015/02/23.
//  Copyright (c) 2015年 moguraproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource,
    tableViewCellDelegate {
    
    let list = [
        "test",
        "Iniesta is the best player in the world, i think",
        "Sick, sick, sick!!",
        "When you walked out you did me a favour, you made me see reality that love is a bourgeois construct. It's a blatant fallacy",
        "yahoo.co.jp"
    ]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        myTableView.delegate = self;
        myTableView.dataSource = self;
        
        var nib  = UINib(nibName:"TableViewCell", bundle:nil)
        myTableView.registerNib(nib, forCellReuseIdentifier: "TableViewCell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier:NSString = "TableViewCell";
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as TableViewCell!
        cell.setData(list[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView:UITableView!, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
    // MARK: - tableViewCellDelegate
    
    func tableViewCellLinkTapped(linkurl: String) {
        NSLog("リンクがタップされた！")
    }
    
    func tableViewCellTapped(cell: TableViewCell) {
        NSLog("セルがタップされた！")
    }
    
}

