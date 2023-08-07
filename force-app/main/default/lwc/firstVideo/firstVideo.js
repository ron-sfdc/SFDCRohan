import { LightningElement, api } from 'lwc';
// We are importing the Lightning element class from the lwc module 
// This basically means that the decorators , the methods we are using inside the LWC they are primarily comuing from this LWC module


export default class FirstVideo extends LightningElement {
    @api var1 = 'Rohan';
    var2 = 'Rishbah';
    
    // No we have written export over here because if in case like above lightningElemnt class, if someone wants to import our class // then he can do so.
    //How ?
    // import FirstVideo from 'c/FirstVideo'

    // We can also add more JS files in the folder that can become the helper JS file.

    constructor() {
        super();
        alert('We are in Ctor '+this.var2);
    }

    connectedCallback() {
        alert('connected callback '+this.var1);
    }

}