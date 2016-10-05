//
//  ViewController.swift
//  PageView
//
//  Created by Heloise Andrade on 10/5/16.
//  Copyright © 2016 ___Heloise Andrade___. All rights reserved.
//

import UIKit




class ViewController: UIViewController,UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var titlePages = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.titlePages = NSArray(objects: "1", "2") as! [String]
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(index: 0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRect(x:0, y:50, width:self.view.frame.width, height:self.view.frame.size.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
        
    }
    
    
    
    @IBAction func addNewView(_ sender: AnyObject) {
        
        self.titlePages.append(String(self.titlePages.count+1))
        
        
    }
    
    
    
    
    func viewControllerAtIndex(index: Int) -> ContentViewController
        
    {
        
        if (self.titlePages.count == 0) {
            
            return ContentViewController()
            
        }
        
        let vc: ContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        
        vc.titleText = self.titlePages[index] as String
        
        vc.pageIndex = index
        
        
        
        return vc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        
        
        
        
        if (index == 0 || index == NSNotFound)
            
        {
            
            return nil
            
            
            
        }
        
        
        
        index -= 1
        
        return self.viewControllerAtIndex(index: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        
        
        if (index == NSNotFound)
            
        {
            
            return nil
            
        }
        
        
        
        index += 1
        
        
        
        if (index == self.titlePages.count)
            
        {
            
            return nil
            
        }
        
        return self.viewControllerAtIndex(index: index)
        
    }
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
        
    {
        
        return self.titlePages.count
        
    }
    
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
        
    {
        
        return 0
        
    }
    
    
}

