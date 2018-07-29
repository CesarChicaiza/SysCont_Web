export class Configuration {

    //properties
    public static server: string = 'localhost:61598';
    
    public static serverWithApiUrl:string = 'http://' + Configuration.server + '/';

    //constructor
    constructor() {
    }

    public static getToken():string
    {
        return sessionStorage.getItem('id_token');
    } 
}