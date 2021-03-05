Spree.ready(function() {
  'use strict';

  function initProducPropertyActions() {
    $('#product_properties').on('input', '.property_name > input', function(event){
      let propertyName = $(this).val();
      let el = $(this);
      _getProperty(propertyName).done(function(response){
        if (response.count == 1) {
          console.log('ok');
          let property = response.properties[0];
          if (property.value_type == 'text') {
            _renderField(el, property);
          } else {
            _getPropertyValues(property.id).done(function(response){
              console.log('coucou');
              _renderField(el, property, response.property_values);
            });
          } 
        }
      });
    });
  };

  function _getProperty(propertyName) {
    let promise = $.Deferred();
    Spree.ajax({
      method: 'GET',
      url: Spree.pathFor('api/properties'),
      data: { q: { name_eq: propertyName}}
    }).done(function(response){
      promise.resolve(response)
    });
    return promise;
  }

  function _getPropertyValues(propertyId) {
    let promise = $.Deferred();
    Spree.ajax({
      method: 'GET',
      url: Spree.pathFor(`api/properties/${propertyId}/property_values`)
    }).done(function(response){
      promise.resolve(response)
    });
    return promise;
  };

  function _renderField(el, property, propertyValues = []) {
    console.log(propertyValues);
    let valueView = new Spree.Views.Products.ProductPropertyValue({
      property: property,
      productPropertyId: _getProductPropertyId(el),
      propertyValues: propertyValues,
      valueElement: el.parent('td.property_name').next('td.value')
    });
    valueView.render();
  };

  function _getProductPropertyId(el) {
    return el.attr('id').split('_')[4];
  }
  
  initProducPropertyActions();
});
