
import UIKit

open class BNAppDelegate: UIResponder,UIApplicationDelegate {

 
    typealias initWithSTViewBlock = ()->()
    
    var BN_AppName = String() // name
    
    var BN_AppHost = String() // host
    
    var initBlock:  initWithSTViewBlock!
    

    
    public var window: UIWindow?
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        

        self.configRootVC()
        self.st__()
        self.___rr()
        
        return true
    }
    

    
    
}
