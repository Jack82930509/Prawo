class MyPortalController < ApplicationController
  before_action :authenticate_customer!

  def index
    @client = current_customer.client
  end

  def fees
    @fees = current_customer.client.fees.paginate(page: params[:page])
    @total_fees = Fee.where(client_id: current_customer.id).sum(:amount)
  end

  def lawsuits_manage
    @lawsuits = current_customer.client.lawsuits.paginate(page: params[:page])
  end

  def lawsuits_details
    @lawsuit = Lawsuit.find(params[:id])

    if @lawsuit.client.id != current_customer.id
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_url
    end
  end

  def documents_manage
    @lawsuit = Lawsuit.find(params[:lawsuit_id])

    if @lawsuit.client.id != current_customer.id
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_url
    end

    @documents = @lawsuit.documents.paginate(page: params[:page])
  end

  def documents_details
    @document = Document.find(params[:id])

    if @document.lawsuit.client.id != current_customer.id
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_url
    end
  end

  def updates_manage
    @lawsuit = Lawsuit.find(params[:lawsuit_id])

    if @lawsuit.client.id != current_customer.id
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_url
    end

    @updates = @lawsuit.updates.paginate(page: params[:page])
  end

  def updates_details
    @update = Update.find(params[:id])

    if @update.lawsuit.client.id != current_customer.id
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_url
    end
  end
end
