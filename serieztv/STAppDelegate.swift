//
//  STAppDelegate.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

@UIApplicationMain
class STAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: STMainViewController())
        window?.rootViewController = navController
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = UIColor.black
        
        AuthManager.sharedInstance.login(username: "gbu", password: "password", completion: nil, errorCompletion: nil)
        AuthManager.sharedInstance.register(email: "tester1@gmail", username: "tester1", password: "testp", name: "tester", completion: nil, errorCompletion: nil)

        
        MovieManager.sharedInstance.getAllMovies(completion: { (movies) in
            print("List")
            print(movies.count)
            print(movies[0].name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.getTopMovies(withLimit: nil, completion: { (movies) in
            print("Top Without Limit")
            print(movies.count)
            print(movies[0].name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.getTopMovies(withLimit: "3", completion: { (movies) in
            print("Top With Limit")
            print(movies.count)
            print(movies[0].name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.getRecentMovies(withLimit: "3", completion: { (movies) in
            print("Recent With Limit")
            print(movies.count)
            print(movies[0].name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.getRecentMovies(withLimit: nil, completion: { (movies) in
            print("Recent Without Limit")
            print(movies.count)
            print(movies[0].name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.findMovieWith(id: "586a35b952f1c10688cfe375", completion: { (movie) in
            print("Find Movie")
            print(movie.airDate)
            print(movie.characters[0].name)
            print(movie.name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.searchForMovie(genre: "Action", name: nil, completion: { (movies) in
            print(movies.count)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.searchForMovie(genre: nil, name: "Doc", completion: { (movies) in
            print(movies.count)
            print(movies[0].name)
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.searchForMovie(genre: "Action", name: "Doc", completion: { (movies) in
            print(movies.count)
            print(movies[0].genres[0].name)
        }, errorCompletion: nil)
        
        
                SeriesManager.sharedInstance.getAllSeriesList(completion: { (movies) in
                    print("List")
                    print(movies.count)
                    print(movies[0].name)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.getTopSeriesList(withLimit: nil, completion: { (movies) in
                    print("Top Without Limit")
                    print(movies.count)
                    print(movies[0].name)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.getTopSeriesList(withLimit: "3", completion: { (movies) in
                    print("Top With Limit")
                    print(movies.count)
                    print(movies[0].name)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.getRecentSeriesList(withLimit: "3", completion: { (movies) in
                    print("Recent With Limit")
                    print(movies.count)
                    print(movies[0].name)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.getRecentSeriesList(withLimit: nil, completion: { (movies) in
                    print("Recent Without Limit")
                    print(movies.count)
                    print(movies[0].name)
                    print("max try \(movies[1].seasons[0].name)")
                    print("max try \(movies[1].seasons[0].episodes[0].name)")
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.findSeriesWith(id: "586a7c7b92ac9a1abc4bedec", completion: { (movie) in
                    print("Find Movie")
                    print(movie)
                    print(movie.firstAir)
                    print(movie.characters[0].name)
                    print(movie.name)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.searchForSeries(genre: "Action", name: nil, completion: { (movies) in
                    print("Search Genre")
                    print(movies.count)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.searchForSeries(genre: nil, name: "Thr", completion: { (movies) in
                    print("Search Name")
                    print(movies.count)
                    print(movies[0].name)
                }, errorCompletion: nil)
        
                SeriesManager.sharedInstance.searchForSeries(genre: "Action", name: "Doc", completion: { (movies) in
                    print("Search Genre and Name")
                    print(movies.count)
                    print(movies[0].genres[0].name)
                }, errorCompletion: nil)
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

