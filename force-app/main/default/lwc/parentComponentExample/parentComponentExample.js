import { LightningElement } from 'lwc';

export default class ParentComponentExample extends LightningElement {

    handlechildevent(event)
    {
        let firstName = event.detail.Name;
        let department = event.detail.Dept;

        alert(firstName);
        alert(department);
    }
}