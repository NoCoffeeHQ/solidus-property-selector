Spree.Views.Products = Spree.Views.Products || {}; 
Spree.Views.Products.ProductPropertyValue = Backbone.View.extend({
  template: HandlebarsTemplates['products/product_property_value'],

  initialize: function(options) {
    this.property = options.property;
    this.valueElement = options.valueElement;
    this.propertyValues = options.propertyValues;
    this.productPropertyId = options.productPropertyId;
  },

  render: function() {
    this.valueElement.html(
      this.template({
        property: this.property,
        isText: this.property.value_type == 'text',
        propertyValues: this.propertyValues,
        productPropertyId: this.productPropertyId
      })
    );
  },
});
