class ExamplesController < ApplicationController
  
  def index
    if params[:example]
      @examples = Example.where(device: params[:example][:device].downcase)
      @query = @examples[0].device
    else
      @examples = Example.all
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
