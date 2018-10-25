//
//  ViewController.swift
//  PRACTICAPELICULA
//
//  Created by Alumno on 24/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var EscribePelicula: UITextField!
    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var Año: UILabel!
    @IBOutlet weak var Director: UILabel!
    @IBOutlet weak var Genero: UILabel!
    @IBOutlet weak var Tiempo: UILabel!
    @IBOutlet weak var Rated: UILabel!
    @IBAction func Buscar(_ sender: Any) {
        let urlBuscar = "https://www.omdbapi.com/?apikey=4799d46a&t=\(EscribePelicula.text!)"
        
            Alamofire.request(urlBuscar).responseJSON { response in
                if let dictRespuesta = response.result.value as? NSDictionary {
                        if let meow = dictRespuesta.value(forKey: "Response") as? String {
                            self.Titulo.text = meow
                        }
                    if self.Titulo.text == "True" {
                        if let title = dictRespuesta.value(forKey: "Title") as? String {
                            self.Titulo.text = title
                        }
                        if let year = dictRespuesta.value(forKey: "Year") as? String {
                            self.Año.text = year
                        }
                        if let rated = dictRespuesta.value(forKey: "Rated") as? String {
                            self.Rated.text = rated
                        }
                        if let tiempo = dictRespuesta.value(forKey: "Runtime") as? String {
                            self.Tiempo.text = tiempo
                        }
                        if let genero = dictRespuesta.value(forKey: "Genre") as? String {
                            self.Genero.text = genero
                        }
                        if let director = dictRespuesta.value(forKey: "Director") as? String {
                            self.Director.text = director
                        }
                    } else if self.Titulo.text == "False"{
                        self.Titulo.text = "No se encontro"
                         self.Año.text = " "
                         self.Rated.text = " "
                         self.Tiempo.text = " "
                        self.Genero.text = " "
                        self.Director.text = " "
                    }
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

