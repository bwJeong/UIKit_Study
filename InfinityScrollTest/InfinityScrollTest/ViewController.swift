//
//  ViewController.swift
//  InfinityScrollTest
//
//  Created by Byungwook Jeong on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let myRequest = MyRequest()
    var stringArr: [String] = []
    var isFetching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myRequest.fetch { [weak self] stringArr in
            self?.stringArr += stringArr
            
            DispatchQueue.main.async {
                self?.myTableView.reloadData()
            }
        }
    }
    
    func createIndicator() -> UIView {
        let indicatorView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let indicator = UIActivityIndicatorView()
        indicator.center = indicatorView.center
        indicatorView.addSubview(indicator)
        indicator.startAnimating()
        
        return indicatorView
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let contentOffsetY = scrollView.contentOffset.y
        let scrollViewHeight = scrollView.frame.height
            
        if contentOffsetY >= contentHeight - scrollViewHeight  && !isFetching {
            isFetching = true
            
            myTableView.tableFooterView = createIndicator()
 
            myRequest.fetch { [weak self] stringArr in
                self?.stringArr += stringArr

                DispatchQueue.main.async {
                    self?.myTableView.tableFooterView = nil
                    self?.isFetching = false
                    self?.myTableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        let string = stringArr[indexPath.row]
        
        cell.label.text = string
        
        return cell
    }
}
