class AddUserReferenceToJob < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobs, :user
  end
end
