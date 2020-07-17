

import UIKit

struct Vendi {
    var fotoVendi: String
    var vendi: String
}

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryTitleLabel: UILabel!
    
    @IBOutlet weak var countryImageView: UIImageView!
    
}

class CountriesTableViewController: UITableViewController 
{

    let vendet = [
        Vendi(fotoVendi: "Shpella", vendi: "Shpella e Gadimes"),
        Vendi(fotoVendi: "Ujmani", vendi: "Liqeni i Ujmanit"),
        Vendi(fotoVendi: "Bibloteka", vendi: "Bibloteka Kombtare"),
        Vendi(fotoVendi: "Bjeshket", vendi: "Bjeshket e Nemuna"),
        Vendi(fotoVendi: "Mirusha", vendi: "Ujvara e Mirushes"),
        Vendi(fotoVendi: "Etnologjik", vendi: "Muzueu Etnologjik"),
        Vendi(fotoVendi: "Germia", vendi: "Parku i Germise"),
        Vendi(fotoVendi: "Katedralja", vendi: "Katedralja"),
        Vendi(fotoVendi: "Muzeu", vendi: "Muzeu"),
    ]
    
        
    


    override func numberOfSections(in tableView: UITableView) -> Int 
	{
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
	{
        return vendet.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
	{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell

        let country = vendet[indexPath.row]
        cell.countryTitleLabel?.text = country.vendi
        cell.countryImageView?.image = UIImage(named: country.fotoVendi)

        return cell
    }

}
