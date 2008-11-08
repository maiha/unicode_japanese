require 'test/unit'
require File.dirname(__FILE__) + '/../init'

class UnicodeJapaneseTest < Test::Unit::TestCase

  ######################################################################
  ### Basic

  def test_accept_nil
    assert_nothing_raised do
      Unicode::Japanese.new(nil).z2h
    end
  end

  def test_dup
    src = "ア"
    Unicode::Japanese.new(src).z2h
    assert_equal "ア", src
  end

  ######################################################################
  ### Convertions

  def test_z2h
    got = Unicode::Japanese.new("スズキ　アイリ").z2h
    assert_equal "ｽｽﾞｷ ｱｲﾘ", got
  end

  def test_h2z
    got = Unicode::Japanese.new("ｽｽﾞｷ ｱｲﾘ").h2z
    assert_equal "スズキ　アイリ", got
  end    

  def test_class_method
    got = Unicode::Japanese.h2zKanaD("ｽｽﾞｷ ｱｲﾘ")
    assert_equal "ｽズｷ ｱｲﾘ", got
  end    
end
