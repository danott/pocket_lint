require 'test_helper'

describe Person do
  describe "defaults" do
    subject { Person.new }

    it "should be valid" do
      subject.must_be :valid?
    end

    it "should archive by default" do
      subject.action.must_equal "archive"
    end

    it "should run once a month by default" do
      subject.frequency.must_equal "monthly"
    end

    it "should consider items stale after 7 days" do
      subject.criteria.must_equal 7
    end
  end
end
# class PersonTest < ActiveSupport::TestCase
#   attr_reader :person
#
#   def setup
#     @person = Person.new
#   end
#
#   def test_default_archive
#     assert_equal "archive", person.lint_action
#   end
#
#   def test_lint_action_settable
#     person.lint_action = "delete"
#     assert_equal "delete", person.lint_action
#   end
#
#   def test_lint_action_valid
#     person.lint_action = "obliterate"
#     assert !person.valid?
#     raise person.errors.inspect
#   end
# end
