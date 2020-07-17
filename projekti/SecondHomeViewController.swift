

import UIKit

class SecondHomeViewController: UIViewController 
{
    @IBAction func backButtonPressed(sender: AnyObject) 
{
        
        print("back button pressed")
        self.performSegue(withIdentifier: "HomeSegue", sender: self)
        
    }
    @IBAction func ruajVendin(_ sender: Any) 
{
        self.performSegue(withIdentifier: "vendiRuaj", sender: self)
    }
    
    @IBAction func shikoVendet(_ sender: Any) 
{
        self.performSegue(withIdentifier: "Vendet", sender: self)    
}
    @IBAction func shikoUshqimet(_ sender: Any) 
{
                self.performSegue(withIdentifier: "Ushqimet", sender: self)
    }
    

    override func viewDidLoad() 
{
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() 
{
        super.didReceiveMemoryWarning()
    }
    
}
