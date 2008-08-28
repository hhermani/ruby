class AdminController < ApplicationController

  # GET /products
  # GET /products.xml
  def index
    @pictures = Picture.find(:all, :conditions => {:parent_id => nil})

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @products}
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def delete
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.xml  { head :ok }
    end
  end

end #end class
