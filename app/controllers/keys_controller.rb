class KeysController < ApplicationController
  def index
    @keys = $redis.keys('*').map { |k| Key.new k }
    @keys = @keys.paginate(:page => params[:page])
  end
end
