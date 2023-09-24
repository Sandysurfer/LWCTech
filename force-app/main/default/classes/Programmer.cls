public virtual class Programmer extends Employee{
    public integer bonus = 10000;
    public void getinfo(){                             //inheritance example//
      System.debug('salary of employee '+salary);
      System.debug('bonus of programmer '+bonus);  
    }
}