class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'contacts.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    contact.save
    render 'create.html.erb'
  end
  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def contact_form_result
    @new_contact = params["contact_info"]
    render 'contact_form_result.html.erb'
  end
end
