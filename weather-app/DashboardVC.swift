//
//  DashboardVC.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 28/02/23.
//

import UIKit
import Combine
import Network

class DashboardVC: BaseViewController {

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.observeNetworkStatus()
        
    }

    func observeNetworkStatus() {
        NWPathMonitor()
            .publisher(queue: DispatchQueue(label: "monitor"))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
            guard let strongSelf = self else { return }
            if status == .satisfied {
                strongSelf.view.backgroundColor = .brown
            } else {
                strongSelf.view.backgroundColor = .gray
            }
        }.store(in: &cancellables)
    }

}
