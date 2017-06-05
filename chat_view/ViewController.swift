//
//  ViewController.swift
//  chat_view
//
//  Created by Dakshesh patel on 6/3/17.
//  Copyright © 2017 Dakshesh patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    var messages = [String]()
    
    //chat bubble mine custome frame for each cell
    var chatBubbleMine : UIView!
    
    
    @IBOutlet weak var inputViewBottomConstraint: NSLayoutConstraint!
    
    @IBAction func send(_ sender: Any) {
        
        messages.append(self.chatField.text!)
        
        self.tblView.reloadData()
        if(messages.count > 0){
            tblView.scrollToBottom(animated: true)
        }
    }
    @IBOutlet weak var chatField: UITextField!
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tblView.register(ChatCell.self, forCellReuseIdentifier: "CELL")
        tblView.delegate = self
        tblView.dataSource = self
        
         chatField.delegate = self
        
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 50
        
        tblView.allowsSelection = false
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWasShown), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillBeHidden), name:NSNotification.Name.UIKeyboardWillHide, object: nil);

        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.chatField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.chatField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.chatField.resignFirstResponder()
        return true
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell : ChatCell
        cell = tblView.dequeueReusableCell(withIdentifier: "CELL") as! ChatCell
        
            cell.layoutIfNeeded()
        var chatBubbleDataMine = ChatBubbleData(text: messages[indexPath.row] , image : nil , date: NSDate(), type: .Opponent)
        chatBubbleMine = ChatBubble(data: chatBubbleDataMine, startY: 5, leadMargin: 40)
        
        
        
            return chatBubbleMine.frame.size.height + 50
       
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? ChatCell
        
       
        
        var chatBubbleDataMine = ChatBubbleData(text: messages[indexPath.row] , image : nil , date: NSDate(), type: .Opponent)
               chatBubbleMine = ChatBubble(data: chatBubbleDataMine, startY: 5, leadMargin: 40)
               cell?.contentView.addSubview(chatBubbleMine)
        
        return cell!
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWasShown(aNotification: NSNotification) {
        let info = aNotification.userInfo! as! [String: AnyObject],
        kbSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size,
        
        contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        self.inputViewBottomConstraint.constant = kbSize.height
        
        self.tblView.contentInset = contentInsets
        self.tblView.scrollIndicatorInsets = contentInsets
        
        var aRect = self.tblView.frame
        aRect.size.height -= kbSize.height
    }
    
    func keyboardWillBeHidden(aNotification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.inputViewBottomConstraint.constant = 0
        self.tblView.contentInset = contentInsets
        self.tblView.scrollIndicatorInsets = contentInsets
    }


}

