public class AddUserToGroupModule {
    
    @future
    public static void AddUsers()
    {
        Set<Id> UserSet = new Set<Id>();
        List<GroupMember> groupId = [SELECT Id, GroupId, UserOrGroupId,Group.type FROM GroupMember where Group.Name = 'All_users'];
        List<GroupMember> gr = new List<GroupMember>();
        for(GroupMember eachgroup :groupId){
            UserSet.add(eachgroup.UserOrGroupId);
            System.debug('UserSet' +UserSet);
            
            List<User> UserList = [SELECT Id, Username, Alias, CreatedDate FROM User where CreatedDate = Today AND IsActive = true];
            for(User addUser : UserList){
                GroupMember newMember = new GroupMember();
                newMember.GroupId = eachgroup.GroupId;
                newMember.UserOrGroupId = addUser.Id;
                gr.add(newMember);
            }
        }
        insert gr;
    }
    
    @future
    @testvisible
    public static void addUserToCollabration(){
        List<CollaborationGroupMember> gr = new List<CollaborationGroupMember>();
        List<CollaborationGroup> groupId = [Select Id,Name From CollaborationGroup where Name = 'Users'];
        List<User> UserList = [SELECT Id, Username, Alias, CreatedDate FROM User where CreatedDate = Today AND IsActive = true];
        for(CollaborationGroup eachGroup : groupId){
            for(User addUser: UserList){
                CollaborationGroupMember newMember = new CollaborationGroupMember();
                newMember.CollaborationGroupId = eachGroup.Id;
                newMember.CollaborationRole = 'Standard';
                newMember.MemberId = addUser.Id;
                gr.add(newMember);
                
                FeedItem post = new FeedItem();
                post.ParentId = eachGroup.Id;
                post.CreatedById = addUser.Id;
                post.Title = 'Congratulations';
                post.Body = 'Congratulations '+addUser.Username;
                insert post;
            }
        }
        insert gr;
        
    }
}