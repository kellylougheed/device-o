class ExamplesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:example]
      @examples = Example.where(device: params[:example][:device].downcase).paginate(:page => params[:page], :per_page => 10)
      @query = params[:example][:device]
    else
      @examples = Example.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def random
    @example = Example.order("RANDOM()").first
  end

  def create
    @example = Example.new(example_params)
    if @example.invalid?
      flash[:error] = 'Please enter a valid example longer than 10 characters with a device selected.'
      redirect_to root_path
    else
      @example.user_id = current_user
      @example.save
      redirect_to root_path
      flash[:success] = 'Thanks for adding an example!'
    end
  end

  private

  def example_params
    params.require(:example).permit(:text, :device)
  end

end
