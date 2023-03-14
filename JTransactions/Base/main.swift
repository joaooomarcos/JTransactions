// https://hacknicity.medium.com/how-to-switch-your-ios-app-and-scene-delegates-for-improved-testing-9746279378c3
import UIKit

let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  nil,
                  NSStringFromClass(appDelegateClass))
