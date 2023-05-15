//
//  Podcast+Tableview.swift
//  stationclub
//
//  Created by Salah's iMac on 11/04/2023.
//

import UIKit

extension PodcastController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func initCollectionView() {
        tagCollectionView.initialize(cellClass: TagCell.self, delegate: self, dataSource: self)
        tagCollectionView.enableAutomaticCellSize()
        
        guestCollectionView.initialize(cellClass: GuestCell.self, delegate: self, dataSource: self)
//        guestCollectionView.enableAutomaticCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == tagCollectionView {
            return presenter.podcast.tags.count
        } else {
            return presenter.podcast.guests.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == tagCollectionView {
            let cell = collectionView.dequeue(cellClass: TagCell.self, indexPath: indexPath)
            cell.configure(with: presenter.podcast.tags[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeue(cellClass: GuestCell.self, indexPath: indexPath)
            cell.configure(with: presenter.podcast.guests[indexPath.row])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == guestCollectionView {
            let width = 100
            let height = 150

            return CGSize(width: width, height: height)
        }
        return CGSize(width: 100, height: 100)
    }
    
}


