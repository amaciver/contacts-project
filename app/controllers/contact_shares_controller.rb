class ContactSharesController < ApplicationController

  def create
    share = ContactShare.new(share_params)
    if share.save
      render json: share
    else
      render(
        json: share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    share = ContactShare.find(params[:id])
    share.destroy
    render json: share
  end

  private
  def share_params
    params.require(:share).permit(:user_id, :contact_id)
  end
end
