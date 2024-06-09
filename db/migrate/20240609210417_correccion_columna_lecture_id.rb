class CorreccionColumnaLectureId < ActiveRecord::Migration[7.1]
  def change
    change_table :nota do |t|
      t.rename :lectureId, :lecture_id
    end
  end
end
