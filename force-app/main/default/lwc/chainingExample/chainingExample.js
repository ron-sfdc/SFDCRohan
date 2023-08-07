import { LightningElement } from 'lwc';
import methodName1 from '@salesforce/apex/ChainingExampleController.methodName1';
import methodName2 from '@salesforce/apex/ChainingExampleController.methodName2';
import methodName3 from '@salesforce/apex/ChainingExampleController.methodName3';
import methodName4 from '@salesforce/apex/ChainingExampleController.methodName4';


export default class ChainingExample extends LightningElement {
    handleChain() {
        console.log('### handle Chain is called starting');

        methodName1()
            .then((result) => {
                console.log(result);
            })
            .catch((error) => {
                
            });
            console.log('### handle Chain is called starting 2222222222');
        methodName2()
            .then((result) => {
                console.log(result);
            })
            .catch((error) => {
                
            });

            console.log('### handle Chain is called starting 333333');
        methodName3()
            .then((result) => {
                console.log(result);
            })
            .catch((error) => {
                
            });

            console.log('### handle Chain is called starting 4444444');
        methodName4()
            .then((result) => {
                console.log(result);
            })
            .catch((error) => {
                
            });
        
            console.log('### handle Chain is called Ending');

    }
}