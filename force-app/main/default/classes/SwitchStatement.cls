public class SwitchStatement {
    
    public static void switchMethod(String name){
        Switch on name{
            //CASE 1:
            when 'sandy'{
                System.debug('He is a salesforce developer');
            }
            //CASE 2:
            when 'sachin'{
                System.debug('He is javascript developer');
            }
            //CASE 3:
            when 'rahul'{
                System.debug('He is Frontend developer');
            }
            //CASE 4:
            when else{
                System.debug('No such info about '+name);
            }
        }
    }
    
}