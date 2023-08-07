import { LightningElement, api, track, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import OWNER_EMAIL_FIELD from '@salesforce/schema/Account.Owner.Email';

export default class MyComponent extends LightningElement {
    @track fields = ['Name', 'Type', 'Industry'];
    objectName = 'Account';
    @api recordId;

    /* Expose schema objects/fields to the template. */
    accountObject = ACCOUNT_OBJECT;

    /* Load Account.Name for custom rendering */
    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, OWNER_EMAIL_FIELD] })
    record;

    /** Get the Account.Name value. */
    get nameValue() {
        return this.record.data ? getFieldValue(this.record.data, NAME_FIELD) : '';
    }

    get ownerEmailValue() {
        return this.record.data ? getFieldValue(this.record.data, OWNER_EMAIL_FIELD) : '';
    }
}