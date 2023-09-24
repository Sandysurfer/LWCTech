import { LightningElement } from 'lwc';

export default class ShowPanelUsingToggle extends LightningElement {
    
    isDisplayPanel = false;
    buttonLabel="Show";
    handleClick()
    {
        this.isDisplayPanel = !this.isDisplayPanel;
        this.buttonLabel = this.isDisplayPanel?"Hide":"Show";
    }
}