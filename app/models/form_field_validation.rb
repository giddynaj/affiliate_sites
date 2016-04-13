class FormFieldValidation < ActiveRecord::Base
  has_many :form_fields, -> { order "form_field_validation_memberships.validation_order" }, :through => :form_field_validation_memberships
  has_many :form_field_validation_memberships


  def test(value)
   self.send(name, value) if !name.match("html_")
  end
  
  def html_validation
   self.send(self.name.to_s) if name.match("html_")
  end

  def method_missing(m, *args, &block)  
    puts  "There's no method called #{m} here -- please try again."  
    return nil
  end

  # TODO http://html5pattern.com/Miscs for patterns
  #
  def html_email
  return { type: 'email' }
  #type email
  end

  def html_required
    return { required: "" }
  end

  def html_phone
    return { pattern: '\d{3}[\-]\d{3}[\-]\d{4}' }
  end

  def html_zipcode
    return { pattern: '(\d{5}([\-]\d{4})?)' }
  end

  def notpleaseselect(value)
    return value.to_s != "Please select" ?  nil : "Required"
  end

  def notempty(value)
    return value.to_s != "" ?  nil : "Required"
  end
  
  def notShouldNotBeHere(value)
    return value.to_s != "Should not be here" ?  nil : "Should not be this value"
  end
end
