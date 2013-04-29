

$(function(){  // $(document).ready shorthand


//INITIALIZE HIDE/SHOW
/*
  if(!($('#patient_comment_attributes_prior_cs').is(':checked')))
  	{$('#patient_comment_attributes_location_of_placenta').attr('disabled','disabled');}
  if(!($('#patient_comment_attributes_prior_cs').is(':checked')))
  	{$('#patient_comment_attributes_cs_times').attr('disabled','disabled');}*/
  $("#hidden_cardiac_checkbox").hide();
  $("#hidden_hemophilia_checkbox").hide();
  $("#hidden_thrombophilia_checkbox").hide();
  $("#hidden_diabetes_checkbox").hide();
  $("#hidden_preeclampsia_checkbox").hide();
  if(!$("#hidden_cardiac_checkbox").is(':checked')){$(".cardiac_form_set").hide();}
  if(!$("#hidden_hemophilia_checkbox").is(':checked')){$(".hemophilia_form_set").hide();}
  if(!$("#hidden_thrombophilia_checkbox").is(':checked')){$(".thrombophilia_form_set").hide();}
  if(!$("#hidden_diabetes_checkbox").is(':checked')){$(".diabetes_form_set").hide();}
  if(!$("#hidden_preeclampsia_checkbox").is(':checked')){$(".preeclampsia_form_set").hide();}



////
//Initialize Counts
	var cardiac_form_ids=new Array("mitral_vr","aortic_vr","aortic_stenosis","aoritic_regurg","vitral_valve_proalapse","valve_replacement","congential_heart_disease","cong_hd_repair","cardiomyopathy","coronary_artery_disease","pulmonary_hypertension","cardiac_disease_free_text");
	cardiac_count=update_count(cardiac_form_ids,"cardiac_count");

	var hemophilia_form_ids=new Array("atp","ttp","thrombocytopenia","vw_disease","factor_deficiency","hemophilia_free_text");
	update_count(hemophilia_form_ids,"hemophilia_count");

	var thrombophilia_form_ids=new Array("antithrombin","prot_c_deficiency","prot_s_deficiency","factor_v_leiden","lupus_anticoag","anticoag_meds","thrombophilia_free_text","hep_sq_mg","hep_iv_mg","lmwh_mg");
	update_count(thrombophilia_form_ids,"thrombophilia_count");

	var diabetes_form_ids=new Array("gestational_diabetes","type_1_diabetes","type_2_diabetes","gdma1","gdma2");
	update_count(diabetes_form_ids,"diabetes_count");

	var preeclampsia_form_ids=new Array("mild_pre","sev_pre","pre_bp","pre_plat","e_bp","e_plat");
	update_count(preeclampsia_form_ids,"preeclampsia_count");



//VR enable/disable
	enable_disable(['valve_replacement'],['aortic_vr','mitral_vr'],[],[],['vr_text']);

  $('#patient_comment_attributes_valve_replacement').change(function(){//VR enable/disable
		enable_disable(['valve_replacement'],['aortic_vr','mitral_vr'],[],[],['vr_text']);
		update_count(cardiac_form_ids,"cardiac_count");//update cardiac count
  });
////

//GD enable/disable
	enable_disable(['gestational_diabetes'],['gdma1','gdma2'],[],[],['gd_text']);

  $('#patient_comment_attributes_gestational_diabetes').change(function(){
		enable_disable(['gestational_diabetes'],['gdma1','gdma2'],[],[],['gd_text']);
		update_count(diabetes_form_ids,"diabetes_count");
  });
////

//Multiple Gestation enable/disable
	enable_disable(['multiple_gestation'],['twins','triplets'],[],[],['mg_text']);

  $('#patient_comment_attributes_multiple_gestation').change(function(){
		enable_disable(['multiple_gestation'],['twins','triplets'],[],[],['mg_text']);
  });
////

//Prior CS enable/disable
	enable_disable(['prior_cs'],[],['location_of_placenta','cs_times'],[],['p_cs_text']);

  $('#patient_comment_attributes_prior_cs').change(function(){
		enable_disable(['prior_cs'],[],['location_of_placenta','cs_times'],[],['p_cs_text']);
  });
////

//anticoag meds enable/disable
	enable_disable(['anticoag_meds'],[],['hep_sq_mg','hep_iv_mg','lmwh_mg'],['hep_sq_when_2i','hep_sq_when_3i','hep_sq_when_1i','hep_sq_when_4i','hep_sq_when_5i','hep_iv_when_2i','hep_iv_when_3i','hep_iv_when_1i','hep_iv_when_4i','hep_iv_when_5i','lmwh_when_2i','lmwh_when_3i','lmwh_when_1i','lmwh_when_4i','lmwh_when_5i'],['ac_text']);

  $('#patient_comment_attributes_anticoag_meds').change(function(){
		enable_disable(['anticoag_meds'],[],['hep_sq_mg','hep_iv_mg','lmwh_mg'],['hep_sq_when_2i','hep_sq_when_3i','hep_sq_when_1i','hep_sq_when_4i','hep_sq_when_5i','hep_iv_when_2i','hep_iv_when_3i','hep_iv_when_1i','hep_iv_when_4i','hep_iv_when_5i','lmwh_when_2i','lmwh_when_3i','lmwh_when_1i','lmwh_when_4i','lmwh_when_5i'],['ac_text']);
		update_count(thrombophilia_form_ids,"thrombophilia_count");
  });

//Preeclampsia enable/disable
	enable_disable(['mild_pre','sev_pre'],[],['pre_bp','pre_plat'],['pre_when_2i','pre_when_3i','pre_when_1i','pre_when_4i','pre_when_5i'],['preeclampsia_text']);
  $('#patient_comment_attributes_mild_pre').change(function(){
		enable_disable(['mild_pre','sev_pre'],[],['pre_bp','pre_plat'],['pre_when_2i','pre_when_3i','pre_when_1i','pre_when_4i','pre_when_5i'],['preeclampsia_text']);
		update_count(preeclampsia_form_ids,"preeclampsia_count");
  });
  $('#patient_comment_attributes_sev_pre').change(function(){
		enable_disable(['mild_pre','sev_pre'],[],['pre_bp','pre_plat'],['pre_when_2i','pre_when_3i','pre_when_1i','pre_when_4i','pre_when_5i'],['preeclampsia_text']);
		update_count(preeclampsia_form_ids,"preeclampsia_count");
  });


//enable/disable function will work for checkboxes_are_checked when checking to see if ANY of the checkboxes are checked NOT ALL of them
	function enable_disable(checkboxes_are_checked,checkboxes,textfields,selections,span_string)
	{
	var iter=0;
	var enable_flag=0;
	var joint_array=checkboxes.concat(textfields,selections)
		for(iter=0;iter<checkboxes_are_checked.length;iter++)
		{
		  if($("#patient_comment_attributes_"+checkboxes_are_checked[iter]).is(':checked'))
			{
				enable_flag=1;
				break;
		  }
		}

		if(enable_flag==1)
		{
			for(iter=0;iter<joint_array.length;iter++)
			{
				$("#patient_comment_attributes_"+joint_array[iter]).removeAttr('disabled');
      	for(i=0;i<document.getElementsByClassName(span_string).length;i++)
				{
					document.getElementsByClassName(span_string)[i].style.opacity="1";
				}
			}
		}
		else
		{
			for(iter=0;iter<joint_array.length;iter++)
			{
      	$("#patient_comment_attributes_"+joint_array[iter]).attr('disabled','disabled');
      	for(i=0;i<document.getElementsByClassName(span_string).length;i++)
					{
						document.getElementsByClassName(span_string)[i].style.opacity=".3";
					}
			}
			for(iter=0;iter<checkboxes.length;iter++)
			{      
				$("#patient_comment_attributes_"+checkboxes[iter]).prop('checked',false);
			}
			for(iter=0;iter<textfields.length;iter++)
			{
      	document.getElementById("patient_comment_attributes_"+textfields[iter]).value="";
			}
		}
	}
////




	var cardiac_count=0;
	var hemophilia_count=0;
	var thrombophilia_count=0;
	var diabetes_count=0;
	var preeclampsia_count=0;

//slide down/up function
	function slide(slide_checkbox_string,slide_form_set_string,slide_triangle_string)
	{
    if($(slide_checkbox_string).is(':checked'))
    {    
        $("."+slide_form_set_string).slideDown(200);
				$('.'+slide_triangle_string).rotate({angle:0,animateTo:90,duration:200});
				cardiac_count=1;
    }
    else
    {    
        $("."+slide_form_set_string).slideUp(200);
				$('.'+slide_triangle_string).rotate({angle:90,animateTo:0,duration:200});
				cardiac_count=0;
    }
	}	
//Cardiac Field Set

  $("#hidden_cardiac_checkbox").change(function()
  {
 		slide(this,"cardiac_form_set",'cardiac_triangle_img');
  });

//Hemophilia Field Set
  $("#hidden_hemophilia_checkbox").click(function()
  {
 		slide(this,"hemophilia_form_set",'hemophilia_triangle_img');
  });
/////

//Thrombophilia Field Set
  $("#hidden_thrombophilia_checkbox").click(function()
  {
 		slide(this,"thrombophilia_form_set",'thrombophilia_triangle_img');
  });
////

//Diabetes Field Set
  $("#hidden_diabetes_checkbox").click(function()
  {
 		slide(this,"diabetes_form_set",'diabetes_triangle_img')
  });
////

//Preeclampsia Field Set
  $("#hidden_preeclampsia_checkbox").click(function()
  {
 		slide(this,"preeclampsia_form_set",'preeclampsia_triangle_img')
  });
////

//Cardiac Counter
	$(".cardiac_form_table").click(function()
	{
		update_count(cardiac_form_ids,"cardiac_count");
	});
	$("#patient_comment_attributes_cardiac_disease_free_text").change(function()
	{
		update_count(cardiac_form_ids,"cardiac_count");
	});

////

//Hemophilia Counter
	$(".hemophilia_form_table").click(function()
	{
		update_count(hemophilia_form_ids,"hemophilia_count");
	});
	$("#patient_comment_attributes_hemophilia_free_text").change(function()
	{
		update_count(hemophilia_form_ids,"hemophilia_count");
	});

////

//Thrombophilia Counter
	$(".thrombophilia_form_table").click(function()
	{
		update_count(thrombophilia_form_ids,"thrombophilia_count");
	});
	$("input[id='patient_comment_attributes_thrombophilia_free_text'],input[id='patient_comment_attributes_hep_sq_mg'],input[id='patient_comment_attributes_hep_iv_mg'],input[id='patient_comment_attributes_lmwh_mg']").change(function(e)
	{
		update_count(thrombophilia_form_ids,"thrombophilia_count");
	});
////
//Diabetes Counter
	$(".diabetes_form_table").click(function()
	{
		update_count(diabetes_form_ids,"diabetes_count");
	});

////
//Preeclampsia Counter
	$(".preeclampsia_form_table").click(function()
	{
		update_count(preeclampsia_form_ids,"preeclampsia_count");
	});
	$("input[id='patient_comment_attributes_pre_bp'],input[id='patient_comment_attributes_pre_plat'],input[id='patient_comment_attributes_e_bp'],input[id='patient_comment_attributes_e_plat']").change(function(e)
	{
		update_count(preeclampsia_form_ids,"preeclampsia_count");
	});

////

//Update counter function
	function update_count(form_ids,span_string)
	{
	var count=0;

	for(var i=0;i<form_ids.length;i++)
	{

		if($("#patient_comment_attributes_"+form_ids[i]).is(":checkbox"))
		{
			if(document.getElementById("patient_comment_attributes_"+form_ids[i]).checked){
				count++;
			}
		}else if($("#patient_comment_attributes_"+form_ids[i]).is(":text"))
		{

			if(document.getElementById("patient_comment_attributes_"+form_ids[i]).value.length>0)
			{
				count++;
			}
		}
	}



	document.getElementById(span_string).innerHTML="("+count+")";
}
////

});


