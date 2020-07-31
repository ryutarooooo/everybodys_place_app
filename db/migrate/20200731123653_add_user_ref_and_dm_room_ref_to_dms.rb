class AddUserRefAndDmRoomRefToDms < ActiveRecord::Migration[6.0]
  def change
    add_reference :dms, :user, foreign_key: true
    add_reference :dms, :dm_room, foreign_key: true
    change_column_null :dms, :user_id, false
    change_column_null :dms, :dm_room_id, false
  end
end
