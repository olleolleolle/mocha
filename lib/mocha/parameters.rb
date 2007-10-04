require 'mocha/inspect'

module Mocha
  
  class Parameters
    
    def initialize(parameters, &block)
      @parameters, @block = parameters, block
    end
    
    def match?(parameters)
      if @block then
        return false unless @block.call(*parameters)
      else
        return false unless (@parameters == parameters)
      end
      return true
    end
    
    def to_s
      text = @parameters.mocha_inspect
      text = text.gsub(/^\[|\]$/, '')
      text = text.gsub(/^\{|\}$/, '') if @parameters.length == 1
      "(#{text})"
    end
    
  end

  class AnyParameters
    
    def match?(parameters)
      true
    end
    
    def to_s
      ""
    end
    
  end

end