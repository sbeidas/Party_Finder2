require File.dirname(__FILE__) + '/../test_helper'	

class PartyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   fixtures :parties

  def test_party
    perl_party = party.new :title =>parties(:one).title, 
                         :owner =>parties(:one).owner,
                         :description =>parties(:one).description,
                         :start_time =>parties(:one).start_time,
                         :end_time =>parties(:one).end_time

    assert perl_party.save

    perl_party_copy = party.find(perl_party.id)

    assert_equal perl_party.title, perl_party_copy.title

    perl_party.title = "Ruby Tutorial"

    assert perl_party.save
    assert perl_party.destroy
  end

end
