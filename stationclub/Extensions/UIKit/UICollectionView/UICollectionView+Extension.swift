//
//  UICollectionView+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

typealias UICollectionViewDelegateAndDataSource = UICollectionViewDelegate & UICollectionViewDataSource

extension UICollectionView {
    
    func registerCellNib<Cell: UICollectionViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<Cell: UICollectionViewCell>(cellClass: Cell.Type, indexPath: IndexPath) -> Cell {
        let identifier = String(describing: cellClass.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else { fatalError("Error in cell") }
        return cell
    }
    
    func getCurrentIndexPath() -> IndexPath? {
        var visibleRect = CGRect()
        visibleRect.origin = self.contentOffset
        visibleRect.size = self.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = self.indexPathForItem(at: visiblePoint) else { return nil }
        return indexPath
    }
    
    func initialize<Cell: UICollectionViewCell>(cellClass: Cell.Type, delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource, refreshControl: UIRefreshControl? = nil) {
        self.registerCellNib(cellClass: cellClass)
        self.dataSource = dataSource
        self.delegate = delegate
        self.refreshControl = refreshControl
    }
    
    func enableAutomaticCellSize() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
}
