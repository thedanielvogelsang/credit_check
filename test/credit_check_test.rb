require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCheckTest < Minitest::Test

def test_credit_check_exists
  new_card = CreditCheck.new("arg", "AmericanExpress")
  assert_equal CreditCheck, new_card.class
end

def test_new_credit_takes_argument
  new_card = CreditCheck.new("arg", "Discover")
  assert_equal new_card.creditnum, "arg"
end

def test_credit_check_method_multiplies_every_2
  new_card = CreditCheck.new("12345", "AmericanExpress")
  new_card.credit_check
  assert_equal [1, 4, 3, 8, 5], new_card.creditnum
end

def test_american_express_differently
  new_card = CreditCheck.new("12345", "AmericanExpress")
  new_card2 = CreditCheck.new("12345", "Discover")
  new_card.credit_check
  new_card2.credit_check
  assert_equal [1, 4, 3, 8, 5], new_card.creditnum
  assert_equal [2, 2, 6, 4, 1], new_card2.creditnum
end

def test_it_reassigns_double_digit_sums
  new_card = CreditCheck.new("12345", "Discover")
  new_card.credit_check
  assert_equal [2, 2, 6, 4, 1], new_card.creditnum
end

def test_it_reduces
  new_card = CreditCheck.new("12345", "Discover")
  new_card.credit_check
  assert_equal 15, new_card.creditnum
end

def test_it_puts_valid_or_invalid
  new_card = CreditCheck.new("12345", "Discover")
  new_card2 = CreditCheck.new(342804633855673, "American Express")
  new_card3 = CreditCheck.new(4024007136512380, "Master Card")
  new_card.credit_check
  new_card2.credit_check
  new_card3.credit_check
  assr
  assert
end
