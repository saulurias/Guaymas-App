//
//  ReporteViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 10/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ReporteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate, ReporteManagerDelegate {
    
    let colonias : [String] = [
        "SELECCIONAR COLONIA","100 CASAS","13 DE JULIO","18 DE NOVIEMBRE","22 DE NOVIEMBRE","23 DE MARZO","23 DE NOVIEMBRE","29 DE NOVIEMBRE","5 DE MAYO","ADOLFO DE LA HUERTA","ADOLFO LOPEZ MATEOS","AEROCOMANDER","AEROPUERTO","ALAMO","AMERICAS","AMPLIACION BUROCRATA","AMPLIACION GIL SAMANIEGO","AMPLIACION GOLFO DE CALIFORNIA","AMPLIACION INDEPENDENCIA","AMPLIACION MIGUEL HIDALGO","ANTENA","ANTORCHISTA","ARANJUEZ","ARCOS","ARRECIFES","ATARDECERES","AURORA","BAHIA","BAUTECAS","BELLAVISTA","BICENTENARIO","BRISAS","BUENOS AIRES","BUGAMBILIA","BUROCRATA","CALICHI","CAMPESTRE","CAMPO DE TIRO","CAMPO NUEVO","CANTERA","CARACOL TURISTICO","CARLOS ROMERO D","CASAS BLANCAS","CASTILLO","CENTENARIO","CENTINELA","CENTRO","CERRO GANDARENO","CHOYA","CHUMAMPACO","COLINAS","COLINAS DE MIRAMAR","COLINAS DEL SOL","COLONIA CENTRO","COSTA AZUL","COUNTRY CLUB","CRESTON","CUADRITA","DELICIAS","DIAMANTE","DORADO","EJIDO ALVARO OBREGON","EJIDO FELIPE ANGELES","EJIDO GRACIANO SANCHEZ","EJIDO LAZARO CARDENAS","EJIDO MARIANO ESCOBEDO","EJIDO NUEVO SAN FRANCISCO","EJIDO SAN FERNANDO","EJIDO SANTA MARIA","EJIDO SONORA","EMILIANO ZAPATA","EMPALME","ESTEBAN BACA CALDERON","FATIMA","FEMOSA","FLORES","FOVISSSTE","FRANCISCO MARQUEZ","FUENTE DE PIEDRA","FUENTES","FUENTES RODRIGUEZ","GIL SAMANIEGO","GIL SAMANIEGO 2","GOLFO DE CALIFORNIA","GOLONDRINAS","GUADALUPE","GUADALUPE VICTORIA","GUARIDA DEL TIGRE","GUASIMAS","GUAYMAS CENTRO","GUAYMAS NORTE","HUIRIBIS","HUMBERTO GUTIERREZ","INDEPENDENCIA","INFONAVIT","JACINTO LÓPEZ","JARDINES","JUAN FRANCISCO PATRON MARQUEZ","JUNTAS","LINDAVISTA","LOMA BONITA","LOMA DORADA","LOMA LINDA","LOMAS DE COLOSIO","LOMAS DE CORTES","LOMAS DE FATIMA","LOMAS DE MIRAMAR","LOMAS DE SAN CARLOS","LOMAS DEL GANDARENO","LOMAS MIRAMAR","LOPEZ MATEOS ","MALECON","MANUEL R BOBADILLA","MAR DE CORTES","MARIANA","MARSELLA","MICROONDAS","MIGUEL HIDALGO","MIRADOR","MIRAMAR","MISA","MISION DEL SOL","MISIONEROS","MONTE BELLO","MONTECARLO","MONTELOLITA","MORENO","MURALLA","NICOLAS BRAVO","NIZA","NUEVO PENASCO","OCOTILLO","OCOTILLO 2","OROZ","ORTIZ","PALMAS","PALO VERDE","PARAJE VIEJO","PARQUE INDUSTRIAL","PEDREGAL","PENINSULA","PERIODISTA","PERLA MARINA","PERLAS","PESCADORES","PESQUERO","PETROLERA","PETROLEROS","PINOS","PLAYA DE CORTEZ","PLAYA DE MIRAMAR","PLAYA VISTA 1","PLAYA VISTA 2","PLAYITAS","PLAYITAS 2","PLAZAS","POPULAR","POTAM","PRADERAS","PRADOS","PUEBLO DE BELEM","PUNTA ARENA","PUNTA DE AGUA","PUNTA DE LASTRE","QUINTAS","RAHUN","RANCHITO CAMPESTRE","RASTRO","RASTRO CERRO","RASTRO PLAYA","REAL DE CORTES","RENACIMIENTO","RESBALON","RESIDENCIAL MARSELLA","RINCON DE FATIMA","RINCON DEL BURRO","RIOS","ROBLE","RODRIGO DE TRUANA","RODRIGUEZ ALCAINE","ROMERO DE CHAMPS ","SAHUARAL","SAHUARI","SAHUARIPA","SALVACION","SAN BERNARDO","SAN CARLOS NUEVO GUAYMAS","SAN GERMAN","SAN GERONIMO","SAN GILBERTO","SAN JOSE","SAN JOSE DE GUAYMAS","SAN MARCIAL","SAN MARINO","SAN VICENTE","SANTA CLARA","SANTA FE","SANTA MONICA","SECTOR CRESPON","SONORA","SUENO","TERMOELECTRICA","TETABIATE","TINAJAS","TORIN","TORRES","TRIUNFO DE SANTA ROSA","TULAR","VALIENTE","VALLE BONITO","VALLE DEL MAR","VARAL","VERGELES","VICAM","VILLA SOFIA","VILLA ZARINA ","VILLAHERMOSA","VILLAS","VILLAS DE MIRAMAR","VILLAS DEL PUERTO I","VILLAS DEL PUERTO II","VILLAS DEL PUERTO III","VILLAS DEL TULAR","VILLAS TETAKAWI","VISTA AZUL","VISTA DORADA","YAQUI","YUCATAN"
    ];
    
    


    //MARK: - Reporte Manager Delegate
    func folioObtenido() {
        self.folio = reporteManager.folio;
        cambiarPantalla();
    }
    
    
    //MARK: - IBOutlets
    
    //Image
    @IBOutlet weak var pickedImaged: UIImageView!
    
    //MapView
    @IBOutlet weak var mapView: MKMapView!
    
    //Buttons
    @IBOutlet weak var botonBache: UIButton!
    @IBOutlet weak var botonAlumbrado: UIButton!
    @IBOutlet weak var botonOtro: UIButton!
    @IBOutlet weak var botonEnviarReporte: UIButton!
    @IBOutlet weak var botonTomarFoto: UIButton!
    @IBOutlet weak var botonGaleria: UIButton!
    
    //TextFields
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var interesadoTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var direccionTextField: UITextField!
    @IBOutlet weak var direccionReporteTextField: UITextField!
    
    //Picker View
    @IBOutlet weak var coloniaPicker: UIPickerView!
    
    //MARK: - Variables
    var coloniaSeleccionada : Int = 0;
    var tipoReporte : String = "BACHE";
    var latitud : Double = 27.923371;
    var longitud : Double = -110.889612;
    var folio = Int();
    
    //MARK: - Constantes
    let manager = CLLocationManager();
    let reporteManager = ReporteManager();
    
    //MARK: - Ciclo de vida de la aplicacion
    
    override func viewDidLoad() {
        super.viewDidLoad();
        diseñarBotones();
        textFieldsDelegates();
        self.hideKeyboard();
        coloniaPicker.delegate = self;
        coloniaPicker.dataSource = self;
        
        reporteManager.delegate = self;
        
        manager.delegate = self;
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        manager.requestWhenInUseAuthorization();
        manager.startUpdatingLocation();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    //MARK: - MapView
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        latitud = location.coordinate.latitude;
        longitud = location.coordinate.longitude;
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        //print(location.altitude)
        //print(location.speed)
        
        self.mapView.showsUserLocation = true
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil
            {
                print ("THERE WAS AN ERROR")
            }
            else
            {
                if let place = placemark?[0]
                {
                    //print("\(place.postalCode!)")
                    //print ("\(place.locality!)");
                }
            }
        }
    }
   
    
    
    //MARK: - PickerView Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colonias[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colonias.count;
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coloniaSeleccionada = row;
    }
    
    
    //MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstReponders();
        return true;
    }
    
    func firstReponders(){
        descripcionTextField.resignFirstResponder();
        interesadoTextField.resignFirstResponder();
        telefonoTextField.resignFirstResponder();
        correoTextField.resignFirstResponder();
        direccionTextField.resignFirstResponder();
        direccionReporteTextField.resignFirstResponder();
    }
    
    func textFieldsDelegates(){
        descripcionTextField.delegate = self;
        interesadoTextField.delegate = self;
        telefonoTextField.delegate = self;
        correoTextField.delegate = self;
        direccionTextField.delegate = self;
        direccionReporteTextField.delegate = self;
    }
    
    
    
    //MARK: - Acciones Bache, Alumbrado, Otro..
    
    @IBAction func botonBacheSeleccionado(_ sender: Any) {
        tipoReporte = "BACHE";
        botonBache.setImage(#imageLiteral(resourceName: "bache"), for: .normal);
        botonAlumbrado.setImage(#imageLiteral(resourceName: "grayscale_alumbrado"), for: .normal);
        botonOtro.setImage(#imageLiteral(resourceName: "grayscale_otro"), for: .normal);
    }
    
    @IBAction func botonAlumbradoSeleccionado(_ sender: Any) {
        tipoReporte = "ALUMBRADO";
        botonBache.setImage(#imageLiteral(resourceName: "grayscale_bache"), for: .normal);
        botonAlumbrado.setImage(#imageLiteral(resourceName: "alumbrado"), for: .normal);
        botonOtro.setImage(#imageLiteral(resourceName: "grayscale_otro"), for: .normal);
    }
    
    @IBAction func botonOtroSeleccionado(_ sender: Any) {
        tipoReporte = "OTRO";
        botonBache.setImage(#imageLiteral(resourceName: "grayscale_bache"), for: .normal);
        botonAlumbrado.setImage(#imageLiteral(resourceName: "grayscale_alumbrado"), for: .normal);
        botonOtro.setImage(#imageLiteral(resourceName: "otro"), for: .normal);
    }
    
    
    
    
    //MARK: - Accion Enviar Reporte
    @IBAction func enviarReporte(_ sender: Any) {
        if(validarTexto()){
            
            let imageData = UIImageJPEGRepresentation(pickedImaged.image!, 1)
            
            if(imageData==nil)  { return; }
            
            let reporte = Reporte(medio: "MOVIL", interesado: interesadoTextField.text!, direccion: direccionTextField.text!, colonia: colonias[coloniaSeleccionada], telefono: telefonoTextField.text!, correo: correoTextField.text!, asunto: descripcionTextField.text!, longitud: longitud, latitud: latitud, foto: imageData!, tipo: tipoReporte);
            
            
            reporteManager.enviarReporte(reporte: reporte);
            
            self.limpiarFormulario();

        }
    }
    
    func cambiarPantalla(){
        if let mensajeReporteViewController = self.storyboard?.instantiateViewController(withIdentifier: "mensajeReporteVC") as? MensajeReporteViewController {
            
            mensajeReporteViewController.folio = self.folio;
            mensajeReporteViewController.nombre = interesadoTextField.text;
            
            self.navigationController?.pushViewController(mensajeReporteViewController, animated: true)
        }
    }
    
    //MARK: - Acciones Foto
    @IBAction func cameraBtnAction(_ sender: UIButton) {
        if(  UIImagePickerController.isSourceTypeAvailable(.camera)){
            let myPickerController = UIImagePickerController();
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera;
            self.present(myPickerController, animated: true, completion: nil);
        }else{
            let actionController: UIAlertController = UIAlertController(title: "Camara no disponible",message: "", preferredStyle: .alert);
            let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void     in
            }
            actionController.addAction(cancelAction);
            self.present(actionController, animated: true, completion: nil);
        }
    }
    
    @IBAction func photoGalleryAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController();
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true;
            self.present(imagePicker, animated: true, completion: nil);
        }
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let imageData = UIImageJPEGRepresentation(pickedImaged.image!, 0.6);
        let compressedJPEGImage = UIImage(data:imageData!);
        
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil);
        
    }
    
    
    //MARK: - Funciones
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject: AnyObject]) {
        pickedImaged.image = image;
        self.dismiss(animated: true, completion: nil);
    }
    
    func diseñarBotones(){
        botonTomarFoto.layer.cornerRadius = 8;
        botonGaleria.layer.cornerRadius = 8;
        botonEnviarReporte.layer.cornerRadius = 8;
    }
}
