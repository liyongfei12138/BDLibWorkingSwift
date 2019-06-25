
import UIKit

open class BNAppDelegate: UIResponder,UIApplicationDelegate {

 
    public typealias initWithSTViewBlock = ()->()
    
    public var BN_AppName = String() // name
    
    public var BN_AppHost = String() // host
    
    public var initBlock:  initWithSTViewBlock!
    

    
    public var window: UIWindow?
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        

        self.configRootVC()
        self.st__()
     
        
        return true
    }
    

    
    
}
