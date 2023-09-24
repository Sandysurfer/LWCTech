import { LightningElement } from 'lwc';

export default class LwcListenEventVlcPlayer extends LightningElement {
    vol=0;
    con='Please Click on Button to Activate';
    
    handleVolIncrease(event){
        this.con = event.detail;
     if(this.vol < 100){
        this.vol = this.vol+1;
     }
    }

    handleVolDecrease(event){
        this.con = event.detail;
        if(this.vol > 0){
            this.vol = this.vol-1;
         }
    }

}