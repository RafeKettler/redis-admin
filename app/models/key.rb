require 'iconv'
def encode(s)
  ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
  ic.iconv(s + ' ')[0..-2]
end

class Key

  attr_reader :name, :type, :value

  def initialize(key)
    @name = key
    @type = $redis.type @name
    case @type
    when 'string'
      @value = encode($redis.get(@name))
    when 'list'
      @value = $redis.lrange @name, 0, -1
    when 'set'
      @value = $redis.smembers @name
    when 'hash'
      @value = $redis.hgetall @name
    when 'zset'
      @value = $redis.zrange @name, 0, -1, :withscores => true
    end
  end

end
