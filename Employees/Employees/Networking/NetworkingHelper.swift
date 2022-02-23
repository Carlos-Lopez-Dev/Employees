
import Foundation
import Alamofire

class NetworkingHelper {
    
    //Funcion para entrar en la aplicacion
    
    public func login(success: @escaping (_ user: User?)->(), failure: @escaping (_ msg: String?)->(), parameters: Parameters) {
        AF.request("http://localhost/employees/public/api/login", method: .put, parameters: parameters).validate(statusCode: 200...499).responseDecodable(of: Response.self) { response in
            if response.value?.status == 1 {
                success(response.value?.user!)
            } else {
                failure(response.value?.msg)
            }
        }
    }
    
    // Funcion que comprueba el token de acceso
    
    public func checkToken(success: @escaping (_ user: User?)->(), failure: @escaping (_ msg: String?)->(), parameters: Parameters) {
        AF.request("http://localhost/employees/public/api/login", method: .put, parameters: parameters).validate(statusCode: 200...499).responseDecodable(of: Response.self) { response in
            if response.value?.status == 1 {
                success(response.value?.user!)
            } else {
                failure(response.value?.msg)
            }
        }
    }
    
    
    //Funcion para salir
    
    public func logout(success: @escaping (_ msg: String?)->(), failure: @escaping (_ msg: String?)->(), headers: HTTPHeaders) {
        AF.request("http://localhost/employees/public/api/employee/logout", method: .put, headers: headers).validate(statusCode: 200...499).responseDecodable(of: Response.self) { response in
            if response.value?.status == 1 {
                success(response.value?.msg)
            } else {
                failure(response.value?.msg)
            }
        }
    }
    
    //Funcion para recibir un email con la nueva contraseña
    
    public func newPassword(success: @escaping (_ msg: String?)->(), failure: @escaping (_ msg: String?)->(), parameters: Parameters) {
        AF.request("http://localhost/employees/public/api/passwordrecover", method: .put, parameters: parameters).validate(statusCode: 200...499).responseDecodable(of: Response.self) { response in
            if response.value?.status == 1 {
                success(response.value?.msg)
            } else {
                failure(response.value?.msg)
            }
        }
    }
    
    //Funcion para obtener la lista de usuarios
    
    public func userList(success: @escaping (_ users: [User]?)->(), failure: @escaping (_ msg: String?)->(), headers: HTTPHeaders) {
        AF.request("http://localhost/employees/public/api/employee/getall", method: .get, headers: headers).validate(statusCode: 200...499).responseDecodable(of: Response.self) { response in
            if response.value?.status == 1 {
                success(response.value?.data)
            } else {
                failure(response.value?.msg)
            }
        }
    }
    
    //Funcion para crear un nuevo usuario
    
    public func createUser(success: @escaping (_ msg: String?)->(), failure: @escaping (_ msg: String?)->(), token: String, user: Parameters) { 
        let headers : HTTPHeaders =
            ["Token" : token]
        let parameters : Parameters = user
        
        AF.request("http://localhost/employees/public/api/employee/add", method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200...499).responseDecodable(of: Response.self) { response in
            if response.value?.status == 1 {
                success(response.value?.msg)
            } else {
                failure(response.value?.msg)
            }
        }
    }
}
