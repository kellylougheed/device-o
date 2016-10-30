class ExamplesController < ApplicationController
  
  def index
    @example = Example.first
  end

end
