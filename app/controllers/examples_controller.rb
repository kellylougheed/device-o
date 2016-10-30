class ExamplesController < ApplicationController
  
  def index
    @example = Example.first
  end

  def create
    @example = Example.new(example_params)
    if @new_example.invalid?
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
