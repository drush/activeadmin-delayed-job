require 'test_helper'

class ActiveAdminDelayedJobTest < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, ActiveAdminDelayedJob
  end
end
