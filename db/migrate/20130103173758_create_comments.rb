class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :cardiac_disease
			t.boolean :aortic_stenosis
			t.boolean :aoritic_regurg
			t.boolean :mitral_stenosis
			t.boolean :mitral_regurg
			t.boolean :vitral_valve_proalapse
			t.boolean :valve_replacement
			t.boolean :aortic_vr
			t.boolean :mitral_vr
			t.boolean :congential_heart_disease
			t.boolean :cong_hd_repair
			t.boolean :cardiomyopathy
			t.boolean :coronary_artery_disease
			t.boolean :pulmonary_hypertension
			t.boolean :cardiac_disease_free_text
			
      t.timestamps
    end
  end
end
