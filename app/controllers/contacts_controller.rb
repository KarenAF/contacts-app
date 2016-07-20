class ContactsController < ApplicationController
  def index
    if current_user
      sort_attribute = params[:sort]
      # @contacts = Contact.order(sort_attribute)
      @contacts = current_user.contacts.order(sort_attribute)
      render 'index.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page."
      redirect_to '/login'
    end
  end

  def new
    render 'new.html.erb'
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      user_id: current_user.id
    )
    contact.save
    redirect_to "/contacts"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.update(
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
      bio: params["bio"]
    )
    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    redirect_to "/contacts"
  end
end
