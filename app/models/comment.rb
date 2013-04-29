class Comment < ActiveRecord::Base
  attr_accessible :airway, :patient_id, :cardiac_disease, :aortic_stenosis, :aoritic_regurg, :mitral_stenosis, :mitral_regurg, :vitral_valve_proalapse, :valve_replacement, :aortic_vr, :mitral_vr, :congential_heart_disease, :cong_hd_repair, :cardiomyopathy, :coronary_artery_disease, :pulmonary_hypertension, :cardiac_disease_free_text, :chorioamnionitis, :macrosomia, :hemophilia, :atp, :ttp, :thrombocytopenia, :vw_disease, :factor_deficiency, :hemophilia_free_text, :thrombophilia, :antithrombin, :prot_c_deficiency, :prot_s_deficiency, :factor_v_leiden, :lupus_anticoag, :thrombophilia_free_text, :anticoag_meds, :diabetes, :gestational_diabetes, :gdma1, :gdma2, :type_1_diabetes, :type_2_diabetes, :multiple_gestation, :twins, :triplets, :placenta_previa, :placenta_accreta, :placenta_percreta, :prior_cs, :location_of_placenta, :placental_abruption, :polyhydramnios, :substance_abuse, :general_free_text, :mild_pre, :sev_pre, :pre_bp, :pre_plat, :pre_when, :e_bp, :e_plat, :e_when, :lmwh_mg, :lmwh_when

  def abbr_comments
    abbr = ""
    spacing = ""
    
    if self.airway
    	abbr << spacing << "Airway"
    	spacing = ", "
    end
    if self.aortic_stenosis
    	abbr << spacing << "AS"
    	spacing = ", "
    end
    if self.aoritic_regurg
    	abbr << spacing << "AR"
    	spacing = ", "
    end
    if self.mitral_stenosis
    	abbr << spacing << "MStenosis"
    	spacing = ", "
    end
    if self.mitral_regurg
    	abbr << spacing << "MR"
    	spacing = ", "
    end 
    if self.vitral_valve_proalapse
    	abbr << spacing << "MVP"
    	spacing = ", "
		end	    
    if self.aortic_vr
    	abbr << spacing << "AVR"
    	spacing = ", "
    end 
    if self.mitral_vr
    	abbr << spacing << "MVR"
    	spacing = ", "
    end  
    if self.congential_heart_disease
    	abbr << spacing << "CHD"
    	spacing = ", "
    end  
    if self.cong_hd_repair
    	abbr << spacing << "CHD repair"
    	spacing = ", "
    end  
    if self.cardiomyopathy 
    	abbr << spacing << "Cardiomyopathy"
    	spacing = ", "
    end 
    if self.coronary_artery_disease 
    	abbr << spacing << "CAD"
    	spacing = ", "
    end 
    if self.pulmonary_hypertension
    	abbr << spacing << "Pulm HTN"
    	spacing = ", "
    end  
    unless self.cardiac_disease_free_text == ""
    	abbr << spacing << cardiac_disease_free_text
    	spacing = ", "
    end	
    if self.chorioamnionitis
    	abbr << spacing << "Chorio"
    	spacing = ", "
    end  
    if self.hemophilia 
    	abbr << spacing << "Hemo"
    	spacing = ", "
    end 
    if self.atp
    	abbr << spacing << "ATP"
    	spacing = ", "
    end  
    if self.ttp
    	abbr << spacing << "TTP"
    	spacing = ", "
    end  
    if self.thrombocytopenia
    	abbr << spacing << "Thrombocyto of Preg"
    	spacing = ", "
    end  
    if self.vw_disease
    	abbr << spacing << "vW Disease"
    	spacing = ", "
    end  
    if self.factor_deficiency 
    	abbr << spacing << "Factor Def"
    	spacing = ", "
    end 
    unless self.hemophilia_free_text == ""
    	abbr << spacing << hemophilia_free_text
    	spacing = ", "
    end
    if self.antithrombin 
    	abbr << spacing << "AT III def"
    	spacing = ", "
    end 
    if self.prot_c_deficiency 
    	abbr << spacing << "Prot C def"
    	spacing = ", "
    end 
    if self.prot_s_deficiency 
    	abbr << spacing << "Prot S def"
    	spacing = ", "
    end 
    if self.factor_v_leiden
    		abbr << spacing << "Factor V Leiden"
    	spacing = ", "
    end 
    if self.lupus_anticoag
    	abbr << spacing << "Lupus Anticoag"
    	spacing = ", "
    end  
    unless self.thrombophilia_free_text == ""
    	abbr << spacing << thrombophilia_free_text
    	spacing = ", "
    end
    if self.anticoag_meds
    	abbr << spacing << "anitcoag meds"
    	spacing = ", "
    end  
    if self.gestational_diabetes
    	abbr << spacing << "Gest Diabetes"
    	spacing = ", "
    end  
    if self.gdma1
    	abbr << spacing << "GDMA 1"
    	spacing = ", "
    end  
    if self.gdma2
    	abbr << spacing << "GDMA 2"
    	spacing = ", "
    end  
    if self.type_1_diabetes
    	abbr << spacing << "Type I Diabetes"
    	spacing = ", "
    end  
    if self.type_2_diabetes
    	abbr << spacing << "Type II Diabetes"
    	spacing = ", "
    end   
    if self.macrosomia 
    	abbr << spacing << "Macrosomia"
    	spacing = ", "
    end 
    if self.twins
    	abbr << spacing << "Twins"
    	spacing = ", "
    end  
    if self.triplets 
    	abbr << spacing << "Triplets"
    	spacing = ", "
    end 
    if self.placenta_previa
    	abbr << spacing << "PP"
    	spacing = ", "
    end  
    if self.placenta_accreta
    	abbr << spacing << "PAcc"
    	spacing = ", "
    end  
    if self.placenta_percreta
    	abbr << spacing << "PPerc"
    	spacing = ", "
    end  
    if self.prior_cs
    	abbr << spacing << "Prior CS"
    	spacing = ", "
    end  
    unless self.location_of_placenta == "" || self.location_of_placenta == nil
    	abbr << spacing << location_of_placenta
    	spacing = ", "
    end  
    if self.placental_abruption
    	abbr << spacing << "AP"
    	spacing = ", "
    end  
    if self.polyhydramnios
    	abbr << spacing << "Polyhydramnios"
    	spacing = ", "
    end  
    if self.substance_abuse 
    	abbr << spacing << "SA"
    	spacing = ", "
    end 
    unless self.general_free_text == ""
    	abbr << spacing << general_free_text
    	spacing = ", "
   	end
   	
   	return abbr 
  end 
end
