import { LightningElement } from 'lwc';
import getRecordBidApplication from '@salesforce/apex/BidApplicationProvider.getRecordBidApplication';

export default class ParentTenderApplication extends LightningElement {

tenderAppList;
showTotalCount=0
objTenderApp ={'sObjectType':'Tender_Application__c'}

searchRecordHandler(){
    this.objTenderApp.Name= this.template.querySelector('lightning-input[data-formfield="tendderId"]').value;
    console.log(this.objTenderApp.Name);


    getRecordBidApplication({objTend:this.objTenderApp})
    .then((result) =>{
        console.log(JSON.stringify(result));
        this.tenderAppList= result;
        this.showTotalCount= result.length;

    })
    .catch((error) =>{
        console.log(JSON.stringify(error));
    });
}
}