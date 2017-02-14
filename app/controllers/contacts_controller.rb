class ContactsController < ApplicationController
  def index
    owned_contacts = Contact.where(user_id: params[:user_id])
    shared_contacts = User.find(params[:user_id]).shared_contacts
    out_json = {
      owned_contacts: owned_contacts.to_json,
      shared_contacts: shared_contacts.to_json
    }
    render json: out_json
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end


  private
  def contact_params
    params.require(:contact).permit(:user_id, :email)
  end
end
