# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
