import { LightningElement } from 'lwc';

export default class GreaterThreeNumber extends LightningElement {

    Num1;
    Num2;
    Num3;
    Result;

    firstNumber(event){
       this.Num1 = event.target.value;
    }

    secondNumber(event){
        this.Num2 = event.target.value;
    }

    thirdNumber(event){
        this.Num3 = event.target.value;
    }

    calculateNumber(event){
    const a = parseInt(this.Num1);
    const b = parseInt(this.Num2);
    const c = parseInt(this.Num3);
     
    if(a>b && a>c){
       alert('a is the greater number '+a);
    }
    if(b>a && b>c){
        alert('b is the greater number '+b); 
    }
    if(c>b && c>a){
        alert('c is the greater number '+c);
    }

    }

    capturedata(event){
        const wh = event.target.name;
        if(wh=='aval'){
         this.Num1 = event.target.value;
        }else if(wh=='bval'){
         this.Num2 = event.target.value;
        }else{
          this.Num3 = event.target.value;
        }
    }
    clearMe(event){
        this.Num1 = '';
        this.Num2 = '';
        this.Num3 = '';

    }

    }