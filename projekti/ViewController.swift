

import UIKit

class ViewController: UIViewController 
{

   
    
    
    @IBAction func kliko(_ sender: Any) 
	{
        
      print("Butoni u kliku")
      self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
        
    }
    
    
    @IBOutlet weak var btnRound: UIButton!
    
    
   
    
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
        
        
        btnRound.layer.borderWidth=1
        btnRound.layer.cornerRadius=50
        
    }

    override func didReceiveMemoryWarning() 
	{
        super.didReceiveMemoryWarning()
    }


}
