public class DE_PasswordSynchronizer_DOS {
    
    public List<User> allUsers {get;set;}
    
    public DE_PasswordSynchronizer_DOS() {
    
        allUsers = [SELECT Name, Email 
                    FROM User 
                    WHERE isActive = TRUE];
        
        for (User u : allUsers) {
        
            try {
                System.setPassword(u.Id, 'salesforce2');
                //u.Email = UserInfo.getUserEmail();
                System.Debug('done: ' + u.Name);
                    
            } catch(Exception e) {
                System.Debug('error: ' + e);
            }
        } 
         
        update allUsers;  
        
    }
    
}