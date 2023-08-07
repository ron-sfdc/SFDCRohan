import { LightningElement, track } from 'lwc';

export default class SlotParent extends LightningElement {
    @track abc = 'Poonam Verma'
    testFunc() {
        if(this.abc != 'Naresh verma') {
            this.abc = 'Poonam Verma';
        } else {
            this.abc = 'Naresh verma';
        }
        
    }
}