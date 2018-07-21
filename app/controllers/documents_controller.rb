class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_enabled

  def index
    @documents = Document.paginate(page: params[:page])
  end

  def manage
    @lawsuit = Lawsuit.find(params[:lawsuit_id])

    @documents = @lawsuit.documents.paginate(page: params[:page])
  end

  def details
    @document = Document.find(params[:id])
  end

  def new
    @lawsuit = Lawsuit.find(params[:lawsuit_id])
    @document = Document.new
  end

  def create
    @lawsuit = Lawsuit.find(params[:lawsuit_id])
    @document = Document.new(document_params)
    @document.lawsuit = @lawsuit

    if @document.save
      flash[:notice] = "Document saved successfully."

      @activity_log = Log.new(detail: "Document: #{@document.name} added to Lawsuit: #{@lawsuit.case_number}")
      @activity_log.user = current_user
      @activity_log.save

      redirect_to document_details_path(@document)
    else
      render 'new'
    end
  end

  def remove
    @document = Document.find(params[:id])
    @lawsuit = @document.lawsuit

    @document.destroy
    flash[:notice] = "Document deleted succesfully."

    @activity_log = Log.new(detail: "Document: #{@document.name} removed from Lawsuit: #{@lawsuit.case_number}")
    @activity_log.user = current_user
    @activity_log.save

    redirect_to manage_documents_path(@lawsuit)
  end


  ### Private Methods
  private
    def document_params
      params.require(:document).permit(:name, :url)
    end
end
