import { LightningElement , api} from 'lwc';



 const  columns = [
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: 'Bidder Name', fieldName: 'Bidder_s_Name__c', editable: true },
    { label: 'Bidder Budget', fieldName: 'Bidder_Budget__c', editable: true }
  ];

export default class ChildBidApplication extends LightningElement {

    
    
    columns =columns; 

    @api receivedBidApplication;
    
      


}