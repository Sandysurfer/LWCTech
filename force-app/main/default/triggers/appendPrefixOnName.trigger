trigger appendPrefixOnName on Student__c (before insert) {
    for( Student__c st : Trigger.new)
    {
        if(st.Graduated_Type__c == 'Part time')
            st.Student_Name__c = 'Pt.' +st.Student_Name__c;
        else if(st.Graduated_Type__c == 'Full time')
            st.Student_Name__c = 'Ft.' +st.Student_Name__c;
    }
}