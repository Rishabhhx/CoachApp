//
//  ViewController.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 21/11/22.
//

import UIKit

class COWelcomeScreenVC: COBaseVC {
    
    // MARK: Outlets
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: Properties
    private var currentPage = 1
    private var slideShowComplete = false
    private var slidingTimer:Timer?
    let slideShowImages:[String] = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry", "Lorem Ipsum has been the industry's standard dummy text ever since the", "It has survived not only five centuries, but also the leap into"]

    // MARK: Actions
    @IBAction func getStartedButton(_ sender: Any) {
        let vc = COChooseRoleVC.instantiate(fromAppStoryboard: .onboarding)
        self.push(vc: vc)
    }
    
    @IBAction func skipButton(_ sender: Any) {
        
    }
    
    //MARK: Private Functions
    private func initiateTimerForSlide()
    {
        debugPrint("Timer initiated")
        slidingTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {
            [weak self] _ in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if self.currentPage != self.slideShowImages.count
                {
                    self.currentPage += 1
                    debugPrint("Current page : \(self.currentPage)")
                    self.collectionView.scrollToItem(at: IndexPath(item: self.currentPage - 1, section: 0), at: .right, animated: true)
                    if self.currentPage == self.slideShowImages.count
                    {
                        debugPrint("Slide show complete")
                        self.slidingTimer?.invalidate()
                        self.slidingTimer = nil
                        self.slideShowComplete = true
                    }
                }
            }
        })
    }
    
    // MARK: Initial Setup
    override func initialSetup() {
        pageControl.numberOfPages = slideShowImages.count
        pageControl.currentPage = 0
        self.getStartedButton.applyGradient(colours: [ColorAssest.yellowGrad.colorAssest, ColorAssest.blackGrad.colorAssest])
        getStartedButton.layer.masksToBounds = true
        getStartedButton.layer.cornerRadius = 25
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        initiateTimerForSlide()
        collectionView.registerCell(with: COWelcomeScreenCC.self)
    }
}
