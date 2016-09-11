require 'test_helper'

class AttributeSerializerTest < ActiveSupport::TestCase
  def assert_default_values(instance)
    assert instance.valid?

    assert_equal instance.preferences[:send_email], true
    assert_equal instance.preferences[:send_sms],   false

    assert_equal instance.send_email, true
    assert_equal instance.send_sms,   false
  end

  test "using new" do
    instance = User.new

    assert_default_values instance
  end

  test "using new with arguments" do
    instance = User.new :send_email => false

    assert instance.valid?
    assert_equal instance.send_email, false
    assert_equal instance.send_sms,   false
  end

  test "load instance with default values via find" do
    instance = User.new
    instance.save

    instance = User.find instance.id

    assert_default_values instance
  end

  test "load instance with modified values via find" do
    instance = User.new :send_email => false
    instance.save

    instance = User.find instance.id

    assert_equal instance.send_email, false
    assert_equal instance.send_sms,   false
  end

  test "each instance has separate values" do
    o1 = User.new
    assert_equal o1.send_email, true

    o2 = User.new :send_email => false

    assert_equal o2.send_email, false
    assert_equal o1.send_email, true

    o3 = User.new

    assert_equal o3.send_email, true
    assert_equal o2.send_email, false
    assert_equal o1.send_email, true
  end
end
