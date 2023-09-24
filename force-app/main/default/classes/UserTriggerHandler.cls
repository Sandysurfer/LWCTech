public class UserTriggerHandler {
    
    Public static Group adminGroup = [Select Id From Group WHERE DeveloperName ='Admins' And Type ='Regular' LIMIT 1];
    
    Public static Profile  adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Adminstrator' LIMIT 1];
    
    public static void MoveToAdminsGroup(List<User> newUsers)
    {  
        if(adminGroup != null)
        {
            List<GroupMember> GroupMembers = new List<GroupMember>();
            
            for(User usr : newusers)
            {                                                                   
                if(usr.profileId == adminProfile.id && usr.isActive == true)          
                {
                    GroupMember member = new GroupMember();  
                    member.GroupId = adminGroup.id;
                    member.UserOrGroupId = usr.id;
                    GroupMembers.add(member);
                    
                }
                insert GroupMembers;
            }
            
        }
    }
    
    public static Void UpdateAdminGroup(List<User>newUsers, Map<Id,User> oldUsers)
    {
        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Adminstrator' LIMIT 1];
        
        List<GroupMember> newUserList = new List<GroupMember>();
        
        Set<ID> deletedUserList = new Set<ID>();     //Use Set To retrieve id of deleted users List..
        
        if(adminGroup != Null)
        {
            for(User user : newUsers)                                                 
            {   
                //Check whether the user profile is changed or not i.e SysAdmin to other or Other to SysAdmin
                if(user.ProfileId != oldUsers.get(user.id).profileId &&  user.IsActive)  //profile is Changed but User IS ACTIVE.
                {
                    //Check Whether Current User Profile Is System Adminstrator
                    if(user.profileId == adminProfile.id)  
                    {
                        GroupMember member = new GroupMember();
                        member.GroupId = adminGroup.id;
                        member.UserOrGroupId = user.id;
                        newUserList.add(member); 
                    }
                    else                                                             
                    {
                        deletedUserList.add(user.id);
                    }
                }
                //Profile Of System Admin Will Be Changed From Active or InActive.
                else if(user.IsActive != oldUsers.get(user.Id).IsActive)             
                {
                    
                    if(user.IsActive)
                    {
                        GroupMember member = new GroupMember();
                        member.GroupId = adminGroup.id;
                        member.UserOrGroupId = user.id;
                        newUserList.add(member); 
                    }
                    else
                    {
                        deletedUserList.add(user.Id);
                    }
                }
                
            }
            if(newUserList.size()>0)
            {
                insert newUserList;
            }
            if(deletedUserList.size()>0)
            {
                List<GroupMember> deletedMembersList = [SELECT Id From GroupMember Where GroupId =: adminGroup.id and UserOrGroupId IN: deletedUserList];
                delete deletedMembersList;
            }
            
        }
    }
    //2nd Method..
   
        public static void handleAdminUserChanges(List<User> newUsers, Map<Id, User> oldUsersMap) {
            List<User> usersToAddToGroup = new List<User>();
            List<User> usersToRemoveFromGroup = new List<User>();
            Group adminsGroup = [SELECT Id FROM Group WHERE Name = 'Admins' LIMIT 1];
            
            for (User newUser : newUsers) {
                User oldUser = oldUsersMap.get(newUser.Id);
                
                if (newUser.Profile.Name == 'System Administrator' && newUser.IsActive) {
                    
                    if (oldUser == null || !oldUser.IsActive || oldUser.Profile.Name != 'System Administrator') {
                        usersToAddToGroup.add(newUser);
                    }
                } else if (oldUser != null && oldUser.Profile.Name == 'System Administrator' && oldUser.IsActive) {
                    
                    if (newUser.Profile.Name != 'System Administrator' || !newUser.IsActive) {
                        usersToRemoveFromGroup.add(oldUser);
                    }
                }
            }
            
            if (!usersToAddToGroup.isEmpty()) {
                
                List<GroupMember> groupMembersToAdd = new List<GroupMember>();
                
                for (User user : usersToAddToGroup) {
                    groupMembersToAdd.add(new GroupMember(
                        GroupId = adminsGroup.Id,
                        UserOrGroupId = user.Id
                    ));
                }
                
                insert groupMembersToAdd;
            }
            
            if (!usersToRemoveFromGroup.isEmpty()) {
                
                List<GroupMember> groupMembersToDelete = [
                    SELECT Id FROM GroupMember WHERE GroupId =: adminsGroup.Id AND UserOrGroupId IN :usersToRemoveFromGroup];
                
                delete groupMembersToDelete;
            }
        }
}