require 'test_helper'

describe Person do
  subject { Person.new }

  it "should be valid by default" do
    subject.must_be :valid?
  end

  it "should archive by default" do
    subject.action.must_equal "archive"
  end

  it "should considered_lint at 1 month by default" do
    subject.considered_lint.must_equal 1.month
  end

  it "should correctly parse considered_lint_s" do
    subject.considered_lint_s = "1 year"
    subject.considered_lint.must_equal 1.year

    subject.considered_lint_s = "6 days"
    subject.considered_lint.must_equal 6.days
  end
end
