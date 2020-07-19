

import UIKit


struct Ushqim {
    var fotoEmri: String
    var Ushqimi: String
}
class UshqimTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PershkrimUshqim: UILabel!
    @IBOutlet weak var FotoUshqim: UIImageView!
}

class UshqimeViewController: UITableViewController {

   
    
    
    let ushqime=[
        
        Ushqim(fotoEmri: "Bakllave", Ushqimi: "Bakllave"),
        Ushqim(fotoEmri: "Fli", Ushqimi: "Fli"),
        Ushqim(fotoEmri: "Hajvar", Ushqimi: "Hajvar"),
        Ushqim(fotoEmri:"Leqenik", Ushqimi: "Leqenik"),
        Ushqim(fotoEmri:"Pite", Ushqimi: "Pite"),
        Ushqim(fotoEmri:"Qaj", Ushqimi: "Qaj"),
        Ushqim(fotoEmri:"Qebapa", Ushqimi: "Qebapa"),
        Ushqim(fotoEmri:"Shampite", Ushqimi: "Shampite"),
        Ushqim(fotoEmri:"Speca", Ushqimi: "Speca"),
        Ushqim(fotoEmri:"Tespishte", Ushqimi: "Tespishte"),
        Ushqim(fotoEmri:"Vere", Ushqimi: "Vere"),
        ]
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ushqime.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ushqim", for: indexPath) as! UshqimTableViewCell

        let ushqimi = ushqime[indexPath.row]
        cell.PershkrimUshqim.text = ushqimi.Ushqimi
        cell.FotoUshqim?.image = UIImage(named: ushqimi.fotoEmri)

        return cell
    }

}

