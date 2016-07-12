class ContactsController < ApplicationController
  def contact1
    @contact1 = Contact.first
    render 'contact1.html.erb'
  end

  def index
    @contacts = Contact.all
    render 'contacts.html.erb'
  end

  def contact_form
    render 'contact_form_show.html.erb'
  end

  def contact_form_result
    @new_contact = params["contact_info"]
    render 'contact_form_result.html.erb'
  end
end
