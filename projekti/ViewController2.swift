

import UIKit
import CoreData
class teDhenat: UITableViewCell{
    
    @IBOutlet weak var vendi: UILabel!
    
    @IBOutlet weak var fotoVendi: UIImageView!
    @IBOutlet weak var dataVendit: UILabel!
}
class ViewController2: UIViewController {

  
    @IBOutlet weak var tableView: UITableView!
    var vendetArray: [NSManagedObject] = []

    
    
  
  @IBAction func addName(_ sender: Any) {
    
    let alert = UIAlertController(title: "vendi i ri",
                                  message: "Shto nje vend te ri",
                                  preferredStyle: .alert)
    
    
    alert.addTextField(configurationHandler: { (textFieldVendi) in
      textFieldVendi.placeholder = "vendi"
        
    })
    
    alert.addTextField(configurationHandler: { (textFieldData) in
      
      textFieldData.placeholder = "Data"
    })
    
    let saveAction = UIAlertAction(title: "Ruaj", style: .default) { [unowned self] action in
      
      guard let textField = alert.textFields?.first,
        let nameToSave = textField.text else {
          return
      }
      
      guard let textFieldData = alert.textFields?[1],
        let dateSave = textFieldData.text else {
          return
      }
      
      self.save(vendi: nameToSave, dataVendit: dateSave)
      self.tableView.reloadData()
    }
    
    let cancelAction = UIAlertAction(title: "Anulo",
                                     style: .default)
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    present(alert, animated: true)
  }
  
  //insert
  func save(vendi: String, dataVendit : String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    
    
    let managedContext = appDelegate.persistentContainer.viewContext

    let entity = NSEntityDescription.entity(forEntityName: "Vendet",
                                            in: managedContext)!
    
    
    
    let rreshtiVendit = NSManagedObject(entity: entity,
                                 insertInto: managedContext)
    
   
    rreshtiVendit.setValue(vendi, forKeyPath: "vendi")
    rreshtiVendit.setValue(dataVendit, forKeyPath: "dataVendit")
    
    
    do {
      try managedContext.save()
      vendetArray.append(rreshtiVendit)
      tableView.reloadData()
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
  
  @IBAction func deleteAction(_ sender: Any) {
    
    
    let alert = UIAlertController(title: "Fshije sipas emrit", message: "Shkruani emrin", preferredStyle: .alert)

    let deleteAction = UIAlertAction(title: "Fshije", style: .default) { [unowned self] action in
      guard let textField = alert.textFields?.first , let itemToDelete = textField.text else {
        return
      }
      self.delete(vendi: itemToDelete)
      /*reoad tableview*/
      self.tableView.reloadData()
      
    }
    
    
    let cancelAciton = UIAlertAction(title: "Anulo", style: .default)
    
    
    alert.addTextField()
    
    
    alert.addAction(deleteAction)
    alert.addAction(cancelAciton)
    
    present(alert, animated: true, completion: nil)
  }
  func delete(vendi: String) {
    /*get reference to appdelegate file*/
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Vendet")
    
    fetchRequest.predicate = NSPredicate(format: "vendi == %@" ,vendi)
    do {
      
      let item = try managedContext.fetch(fetchRequest)
      for i in item {
        
        
        managedContext.delete(i)
        
        
        try managedContext.save()
        
        vendetArray.remove(at: (vendetArray.index(of: i))!)
        
      }
      
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
  }
  
  func fetchAllPersons(){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Vendet")
    
  
    do {
      vendetArray = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchAllPersons()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
  }
  
  func delete(rreshtiVendit : Vendet){
    
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    
    do {
      
      managedContext.delete(rreshtiVendit)
      
    } catch {
    }
    
    do {
      try managedContext.save()
    } catch {
    }
  }
  
  func update(vendi:String, dataVendit : String, rreshtiVendit : Vendet) {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    
    let context = appDelegate.persistentContainer.viewContext
    
    do {
      
     
      rreshtiVendit.setValue(vendi, forKey: "vendi")
      rreshtiVendit.setValue(dataVendit, forKey: "dataVendit")
      
      print("\(rreshtiVendit.value(forKey: "vendi"))")
      print("\(rreshtiVendit.value(forKey: "dataVendit"))")
      
    
      do {
        try context.save()
        print("U rujt!")
      } catch let error as NSError  {
        print("Nuk u ruajt  \(error), \(error.userInfo)")
      } catch {
        
      }
      
    } catch {
      print("Error: \(error)")
    }
  }
}

extension ViewController2: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return vendetArray.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let rreshtiVendit = vendetArray[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! teDhenat
    cell.vendi?.text = rreshtiVendit.value(forKeyPath: "vendi") as? String
    cell.dataVendit?.text=rreshtiVendit.value(forKey: "dataVendit") as? String
    cell.fotoVendi?.image=UIImage(named: rreshtiVendit.value(forKey: "vendi") as! String)
    
    return cell
}
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let rreshtiVendit = vendetArray[indexPath.row]
    
    let alert = UIAlertController(title: "Rivendos Vendin",
                                  message: "Rivendos Vendin",
                                  preferredStyle: .alert)
    
    alert.addTextField(configurationHandler: { (textFieldVendi) in
      
      
      textFieldVendi.placeholder = "vendi"
      
      textFieldVendi.text = rreshtiVendit.value(forKey: "vendi") as? String
      
    })
    
    alert.addTextField(configurationHandler: { (textFieldData) in
      
      textFieldData.placeholder = "Data"
      
      
        textFieldData.text = rreshtiVendit.value(forKey: "dataVendit") as? String
    })
    
    let updateAction = UIAlertAction(title: "Rivendos", style: .default) { [unowned self] action in
      
      guard let textField = alert.textFields?[0],
        let nameToSave = textField.text else {
          return
      }
      
      guard let textFieldData = alert.textFields?[1],
        let dateSave = textFieldData.text else {
          return
      }
      
      self.update(vendi : nameToSave, dataVendit: dateSave, rreshtiVendit : rreshtiVendit as! Vendet)
      
      self.tableView.reloadData()
      
    }
    
    let deleteAction = UIAlertAction(title: "Fshij", style: .default) { [unowned self] action in
      
      
      self.delete(rreshtiVendit : rreshtiVendit as! Vendet)
      
      self.vendetArray.remove(at: (self.vendetArray.index(of: rreshtiVendit))!)
      
      self.tableView.reloadData()
      
    }
    
    let cancelAction = UIAlertAction(title: "Anulo",
                                     style: .default)
    
    alert.addAction(updateAction)
    alert.addAction(cancelAction)
    alert.addAction(deleteAction)
    
    present(alert, animated: true)
    
  }
}
