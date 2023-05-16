//
//  SceneDelegate.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import SystemConfiguration

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var reachabilityManager = ReachabilityManager()
    var reachabilityBanner = ReachabilityBanner()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        RootRouter.presentRootScreen(in: window, vc: SignInRouter.assembleModule())
        Localization.shared.delegate = self

        checkReachability()
    }

    func checkReachability() {
        reachabilityManager.start(listener: self)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

extension SceneDelegate: ReachabilityManagerListener {

    func notifyChange(with flags: SCNetworkReachabilityFlags) {
        reachabilityBanner.notifyStatusBar(in: window, for: flags)
    }
}

extension SceneDelegate: LocalizationDelegate {
    
    func resetApp() {
        RootRouter.resetApp()
    }
}
