Dir[File.dirname(__FILE__) + '/sunrise/*.rb'].each {|file| require file }

module Sunrise
  VERSION = '0.2'
end
