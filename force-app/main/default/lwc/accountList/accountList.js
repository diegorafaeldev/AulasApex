import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountListController.getAccounts';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
  
];

export default class AccountList extends LightningElement {

    data = [];
    columns = columns;

    connectedCallback() {
        this.callAccounts();
    }

    callAccounts(){
        getAccounts()
        .then( result => {
            const data =  result;
            this.data = data;
        })
        .catch(error => {
            console.log('error : ' + error);
        })
    }
    

}