import { LightningElement } from 'lwc';

export default class calculator extends LightningElement {
    result = 0;
    firstnumber;
    secondnumber;

    handleClick(event){
        
        if(event.target.label=='Addition'){
            this.result = parseInt(this.firstnumber)+parseInt(this.secondnumber);
        }
        if(event.target.label=='Substraction'){
            this.result = parseInt(this.firstnumber)-parseInt(this.secondnumber);
        }
         if(event.target.label=='Multiplication'){
            this.result = parseInt(this.firstnumber)*parseInt(this.secondnumber);
        }
         if(event.target.label=='Division'){
            this.result = parseInt(this.firstnumber)/parseInt(this.secondnumber);
        }
        if(event.target.label=='Reset'){
            this.result = '';
        }
        
    }
    onChangeHandler(event){
        if(event.target.name=='num1'){
            this.firstnumber = event.target.value;
        }
        if(event.target.name=='num2'){    
            this.secondnumber = event.target.value;
        }
        

    }
}