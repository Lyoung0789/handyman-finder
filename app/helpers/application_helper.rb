module ApplicationHelper

    #renders the error partial 
   def render_error(object)
    render partial: "layouts/errors", locals: {object: object}
   end  

end
