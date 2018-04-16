class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to dashboard_show_path, redirect_options_for(shout)
  end

  private

  def shout_params
    { content: content_from_params }
  end

  def content_from_params
    case params[:shout][:content_type]
    when 'TextShout' then TextShout.new(text_shout_content_params)
    when 'ImageShout' then ImageShout.new(image_shout_content_params)
    end
  end

  def text_shout_content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def image_shout_content_params
    params.require(:shout).require(:content).permit(:image)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: "Shout created!" }
    else
      { alert: "Could not shout. Sorry" }
    end
  end
end
