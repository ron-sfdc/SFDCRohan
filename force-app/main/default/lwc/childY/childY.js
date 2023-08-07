import { LightningElement, api, track } from 'lwc';

export default class ChildY extends LightningElement {
    var1 = 'Rohan Dham';
    @api var2 = 'Rishabh Dham';
    @track var3 = 'Non Reactive';

    obj = {
        nm:'Rohan',
        age : 30
    }

    arr = [1,2,3,4];

    clickMe() {
        this.var1 = 'Chnaged Rohan Dham';
        this.var2 = 'Changed Rishabh Dham';
        this.var3 = 'Chnaged Non Reactive';
        this.obj.age = 40;
        this.obj = {nm:'Bio', age:'41000'};
        this.arr = [5,6,7,8];
    }

    @api
    method1() {
        alert('This is Child class method');
    }

}