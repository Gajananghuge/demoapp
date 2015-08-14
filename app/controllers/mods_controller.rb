class ModsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end
 
  def create
  	@mod = Mod.new
    @mod.title = params[:mod]['title']
    @mod.urn = params[:mod]['urn']
  	if @mod.save
      if @mod.latest
        if Mod.where(:uid => current_user.id).where(:latest => true).count > 1
          @change = Mod.where(:uid => current_user.id).where(:latest => true).first
          @change.latest = false
          @change.save
        end
        @mod.latest = true
      end
    end
    @mod.save
  	redirect_to '/upload'
  end
  private
  def mod_params
    params.require(:mod).permit(:title, :latest, :urn, :uid)
  end
end
