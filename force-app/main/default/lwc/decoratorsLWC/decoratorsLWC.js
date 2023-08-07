import { LightningElement } from 'lwc';

export default class DecoratorsLWC extends LightningElement {
    //There are 3 types of decorators in LWC
    /*
    1. @api : Making a property public
    2. @track : Making a private property reactive
    3. @wire : To Read Salesforce Data

    @track is not required now for most of the datatypes other than Object and Array

    Decorators in Lightning Web Component(LWC)

    The Lightning Web Components programming model has three decorators that add functionality to property or function. Decorators dynamically alter the functionality of a property or function. The ability to create decorators is part of ECMAScript, but these three decorators are unique to Lightning Web Components.

    @api: It is used to expose a variable or functions publically and make properties reactive.
    @track: It is used to make variable private but reactive. Tracked properties are also called private reactive properties.
    @wire: To read Salesforce data, Lightning web components use a reactive wire service. When the wire service provisions data, the component rerenders. Components use @wire in their JavaScript class to specify a wire adaptor or an Apex method.
    Here are three decorators in LWC in more details:

    @api
    Public properties are reactive. If the value of public property changes, the component rerenders. To expose a public property, decorate a field with @api. Public properties define the API for a component.

    To expose a public method, decorate it with @api. Public methods are part of a component’s API. To communicate down the containment hierarchy, owner and parent components can call JavaScript methods on child components.

    @track
    Fields are reactive. If a field’s value changes, and the field is used in a template or in a getter of a property that’s used in a template, the component rerenders and displays the new value.

    There is one use case for @track. When a field contains an object or an array, there’s a limit to the depth of changes that are tracked. To tell the framework to observe changes to the properties of an object or to the elements of an array, decorate the field with @track

    Component rerenders whenever the value of the these variables track or api changes.
    ECMA Script provides as the provision of creating the decorators in JS and that is the thing which is done in the Lightning Element class.

    import { LightningElement, track, api} from  'lwc';

    we can call the api method from the parent component as well just we need to define the method as api in the child class and then call it from the parent method.

    */

    
}