class Unicode::Japanese
  attr_accessor :string

  class << self
    def convert(action, string)
      pattern = Pattern.__send__(action) rescue raise(NotImplementedError, "Undefined Pattern: #{action}")
      table   = Table  .__send__(action) rescue raise(NotImplementedError, "Undefined Table: #{action}")
      string.gsub!(pattern){table[$1]}
      return string
    end

    private
      def method_missing(*args)
        convert(*args)
      end
  end

  def initialize(string)
    @string = string.to_s.dup
  end

  def z2h
    z2hKana
    z2hNum
    z2hAlpha
    z2hSym
  end

  def z2hKana
    z2hKanaD
    z2hKanaK
  end

  def h2z
    h2zKana
    h2zNum
    h2zAlpha
    h2zSym
  end

  def h2zKana
    h2zKanaD
    h2zKanaK
  end

  private
    def method_missing(*args)
      self.class.__send__(args[0], @string)
    end
end
