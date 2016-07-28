class ContactsController < ApplicationController
  def index
    if current_user
      if params[:sort]
        sort_attribute = params[:sort]
        # @contacts = Contact.order(sort_attribute)
        @contacts = current_user.contacts.order(sort_attribute)
        render 'index.html.erb'
      elsif params[:group_id]
        selected_group = Group.find_by(id: params[:group_id])
        @contacts = selected_group.contacts
      else 
        @contacts = current_user.contacts
      end   
    else
      flash[:warning] = "You must be logged in to see this page."
      redirect_to '/login'
    end
  end

  def new
    @contact = Contact.new
    render 'new.html.erb'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      user_id: current_user.id
    )
    if @contact.save
      flash[:success] = "Contact added!"      
      redirect_to "/contacts"
    else
      render 'new.html.erb'
    end
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
    if @contact.save
      flash[:success] = "Contact updated!"
      redirect_to "/contacts/#{@contact.id}"
    else 
      render 'edit.html.erb'
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    redirect_to "/contacts"
  end
end
