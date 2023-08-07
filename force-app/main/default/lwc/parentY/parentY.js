import { LightningElement } from 'lwc';

export default class ParentY extends LightningElement {
    click1() {
        let aa = this.template.querySelector('c-child-y');
        aa.method1();
    }
}