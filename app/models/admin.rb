# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  translator             :boolean          default("false"), not null
#  approver               :boolean          default("false"), not null
#  superuser              :boolean          default("false"), not null
#  admin                  :boolean          default("false"), not null
#  is_active              :boolean          default("true"), not null
#
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:email]

  def active_for_authentication?
    # Uncomment the below debug statement to view
    # the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && active?
  end

  def destroy
    self.is_active = false
  end

  def active?
    is_active ? true : false
  end
end
