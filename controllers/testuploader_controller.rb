class TestuploaderController < ApplicationController

  def index
    @pictures = Picture.find(:all, :conditions => {:parent_id => nil} )
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @pictures }
    end
  end

  def create
    @picture = Picture.new(params[:picture])
    respond_to do |format|
      if @picture.save
        flash[:notice] = 'Asset was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { head :created, :location => picture_url(@picture) }
        format.js do
          responds_to_parent do
            render :update do |page|
#              page.insert_html :bottom, "pictures", :partial => 'picture', :object => @picture
              page.replace_html "picture", :partial => 'picture', :object => @picture
              page.visual_effect :highlight, "picture_#{@picture.id}"
              page.replace_html "formulier", "weggehaald"
            end
          end
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @picture.errors.to_xml }
        format.js do
          reponds_to_parent do
            render :update do |page|
            end
          end
        end
        
      end
    end
  end

  def show
    @picture = Picture.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Invalid Picture"
    redirect_to :action => :get
  end

def add_comment
  @picture = Picture.find(params[:id])
  respond_to do |format|
#    flash[:notice] = 'Asset was successfully created.'
    format.html { render :html }
    format.js
#    format.xml  { head :created, :location => picture_url(@picture) }
  end
end


end
