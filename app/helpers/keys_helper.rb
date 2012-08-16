module KeysHelper
  def render_key(key)
    render :partial => "keys/#{key.type}", :object => key.value
  end
end
