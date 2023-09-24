public class loginController {
    
    public static void logIn(String usernameInput, String passwordInput){
        String username = 'sandeep@sfdcsurfer.com';
        String password = 'sandy@07';
        
        if(username == usernameInput && password == passwordInput){
            System.debug('Logged in Successfully');
        }
        else if(username != usernameInput){
            System.debug('Username is Incorrect');
        }
        else if(password != passwordInput){
            System.debug('password is Incorrect');
        }
        else
        {
            System.debug('Incorrect LogIn Credentials');
        }
    }
    
}