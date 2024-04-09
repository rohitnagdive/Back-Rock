import { LightningElement } from 'lwc';
import createTenderApplicationRecord from '@salesforce/apex/TenderApplicationProvider.createTenderApplicationRecord';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
export default class TenderApplicationInfo extends LightningElement {

    objTender= {'sObjectType':'Tender_Application__c'}

    submitRecord(){

        this.objTender.Account__c= this.template.querySelector('lightning-input[data-formfield="account"]').value;
        this.objTender.Title__c= this.template.querySelector('lightning-input[data-formfield="title"]').value;
        console.log(this.objTender.Account__c);
        console.log(this.objTender.Title__c);
        createTenderApplicationRecord({objTenderApplication:this.objTender})
        .then((result) =>{
            console.log(JSON.stringify(result));
            this.showToastMessage('Record has been Created...!!');
        })
        .catch((error) =>{
            console.log(JSON.stringify(error));
            this.showToastMessage('Record has not been Created....!!');
        });
    }
    showToastMessage(myMessage, variantName) {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: myMessage,
            variant: variantName,
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
}

}