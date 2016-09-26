class ContactsController < ApplicationController
  def new
    @contact = Contact.new()
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to @contact
    else
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:phone, :name)
  end
end
