public class ApexUniversityWrapperExample {
    
    public string course;
    public Integer Duration;
    public Student std;
    
    //Non Parameterized Constructor 
    public ApexUniversityWrapperExample(){
        course ='Electronics';
        Duration = 12;
        Student stds = new Student();
        stds.Name = 'Sandeep';
        stds.Age = 29;
        
        System.debug('coursevalue '+course);
        System.debug('Durationvalue '+Duration);
        System.debug('NameValue '+stds.Name);
        System.debug('AgeValue '+stds.Age);
    }
    
    //Parameterized Constructor
    public ApexUniversityWrapperExample(String crName, Integer crDuration, String caName, Integer caAge){
        this.course = crName;
        this.Duration = crDuration;
        Student st = new Student();
        st.Name =  caName;
        st.Age = caAge;
        
        System.debug('###coursevalue '+course);
        System.debug('###Durationvalue '+Duration);
        System.debug('###NameValue '+st.Name);
        System.debug('###AgeValue '+st.Age);
    }
    
    //Assign value Through a Method...
    public void AssignValue (String crName, Integer crDuration, String caName, Integer caAge){
        this.course = crName;
        this.Duration = crDuration;
        Student st = new Student();
        st.Name =  caName;
        st.Age = caAge;
        
        System.debug('@@@coursevalue '+course);
        System.debug('@@@Durationvalue '+Duration);
        System.debug('@@@NameValue '+st.Name);
        System.debug('@@@AgeValue '+st.Age);
    }
    public class Student{
        
        public string Name;
        public Integer Age;
    }
    
}