//
//  ViewControllerWelcome.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/13/21.
//

import UIKit

class ViewControllerWelcome: UIViewController {

    let container = UIView()
    let apples = UIImageView(image: UIImage(named: "apples"))
    let beverage = UIImageView(image: UIImage(named: "beverage"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let w = view.bounds.width - 100
        let h = view.bounds.height - 500
        container.frame = CGRect(x: 50, y: 350, width: w, height: h)
        view.addSubview(container)
        
        apples.frame = CGRect(x: 0, y: 0, width: w, height: h)
        beverage.frame = apples.frame
        
        container.addSubview(apples)
        
        
        let horizontalSwipeRecognizer = UISwipeGestureRecognizer(target: self, action:
            #selector(ViewControllerWelcome.handleHorizontalSwipe))
        horizontalSwipeRecognizer.numberOfTouchesRequired = 1
        horizontalSwipeRecognizer.direction = [ .left, .right ]
        view.addGestureRecognizer(horizontalSwipeRecognizer)
        
    }
    
    
    @objc
    func handleHorizontalSwipe(_ sender: UISwipeGestureRecognizer) {
        let view1 = apples.superview != nil ? apples : beverage
        let view2 = apples.superview != nil ? beverage : apples
        UIView.transition(with: self.container, duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
                            view1.removeFromSuperview()
                            self.container.addSubview(view2)
        }, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
