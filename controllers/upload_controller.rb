class UploadController < ApplicationController

  def get
    @picture = Picture.new
  end

  def save
    @picture = Picture.new(params[:picture])

    if @picture.save
      redirect_to(:action => 'show', :id => @picture.id)
    else
      render(:action => :get)
    end
  end

  def picture
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
              :filename => @picture.name,
              :type => @picture.content_type,
              :disposition => "inline")
  end

  def prut
    #
    # Ruby special
    # find_by_url mapt automagisch naar field name
    @picture = Picture.find_by_url(params[:url])
  end


  def show
    @picture = Picture.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Invalid Picture"
    redirect_to :action => :get
  end
end


