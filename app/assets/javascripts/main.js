// From Vanilla JS

var list_elem_count = document.querySelectorAll('#steps li').length;

//Steps navigation position
var navigation_pos;
//Ckech mark SVG icon point
var svg_valid_icon = "21.4,4.7 21.4,4.7 21.4,4.7 18.6,7.5 18.6,7.5 8.7,17.4 3,11.7 0,14.5 5.9,20.2 8.7,23 20.2,11.5 24.2,7.5";
	
//Arrow SVG icon point
var svg_arrow_icon = "17.4,8.7 17.4,8.7 8.7,0 5.9,2.8 14.6,11.5 8.7,17.4 8.8,17.3 5.8,20.1 5.9,20.2 8.7,23 20.2,11.5 20.2,11.5";

function changed(obj){
  if (obj.name == 'industry') {
   handleIndustryDropdown(obj);
  }

  url = generateEventUrl(obj);
  send_event(url);
  console.log(obj);
}

function handleIndustryDropdown(obj){
  switch(obj.value){
    case 'Other':
    $('input[name="industry-other"]')[0].value = '';
    $('.industry').removeClass('hidden');
    $('#naicslist').addClass('hidden');
    eraseResults('naicslist');
    break;
    case 'Please select':
    $('input[name="industry-other"]')[0].value = '';
    $('#naicslist').addClass('hidden');
    $('.industry').addClass('hidden');
    eraseResults('naicslist');
    break;
    default:
    $('input[name="industry-other"]')[0].value = obj.value;
    getn($('input[name="industry-other"]')[0]);
    $('.industry').addClass('hidden');
    $('#naicslist').removeClass('hidden');
  }
}

function generateEventUrl(obj){
  var url = obj.name + "=" + obj.value + "&";
  url = form.action + "?" + url + 'type=event';
return url;
}

function send_event(url){
  get(url).then(function(response) {
      console.log("Success!", response);
      try { 
        var parsed_response = JSON.parse(response);
        } catch (err) {
        }
          console.log(parsed_response);
        }, function(error) {
          console.error("Failed!", error);
        });
}

function get(url) {
  // Return a new promise.
  return new Promise(function(resolve, reject) {
    // Do the usual XHR stuff
    var req = new XMLHttpRequest();
    req.open('GET', url);

    req.onload = function() {
      // This is called even on 404 etc
      // so check the status
      if (req.status == 200) {
        // Resolve the promise with the response text
        resolve(req.response);
      }
      else {
        // Otherwise reject with the status text
        // which will hopefully be a meaningful error
        reject(Error(req.statusText));
      }
    };

    // Handle network errors
    req.onerror = function() {
      reject(Error("Network Error"));
    };

    // Make the request
    req.send();
  });
}

function submitPartialFunction(arr_obj){
  url = generateSubmitUrl(arr_obj, 'validate');
  return get_partial(url);
}

function generateSubmitUrl(arr_obj, type){
  var form = document.getElementById("form");
  var url = ""
  if (type != 'submit') {
  for (i = 0; i < form.elements.length; i++) {
    var elm = form.elements[i];
     if (typeof arr_obj == 'undefined' || arr_obj.indexOf(elm.name) > -1) {
     if ((elm.type == 'checkbox' && elm.checked) || (elm.type != 'checkbox')) {
      url += elm.id + "=" + elm.value + "&";
     }
     }
    }
  }
  url = form.action + "?" + url + 'type=' + type;
return url;
}

   function get_first(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        /*eraseResults('list');*/
        try { 
          var parsed_response = JSON.parse(response);
        } catch (err) {
        }
        first_element = parsed_response[0];
        if (first_element.url != undefined) {
          window.location = parsed_response[0].url;
        } else {
          clearFormErrors();
          for (var i = 0; i < parsed_response.length; i++) {
            setElementToError(parsed_response[i]);
          }

        }
        }, function(error) {
          console.error("Failed!", error);
        });
   }

function get_partial(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        /*eraseResults('list');*/
        try { 
          var parsed_response = JSON.parse(response);
        } catch (err) {
        }
        first_element = parsed_response[0];
        if (first_element.action != undefined) {
          /*window.location = parsed_response[0].url;*/
          var current_step_idx = $('#2nav li div.icon2').index(document.getElementsByClassName('current_nav')[0])
          advance_navigation(current_step_idx);
          if (current_step_idx+1 == document.querySelectorAll('#steps li').length) {
            submitFunction();
          }
          
          //window.location = parsed_response[0].url;
          return true;
        } else {
          clearFormErrors();
          for (var i = 0; i < parsed_response.length; i++) {
            setElementToError(parsed_response[i]);
          }
          return false;
          /*  
 * Use HTML5 form validation
 *
 *  http://jsfiddle.net/girlie_mac/te3Qd/ */

        }
        }, function(error) {
          console.error("Failed!", error);
        });
}

   function clearFormErrors() {
   var form = document.getElementsByTagName('form')[0];
   for (var i = 0; i < form.elements.length; i++) {
     setElementToNoError(form.elements[i]);
   }
   }

   function setElementToNoError(field) {
          field_msg = document.getElementById(field.name + "_msg");
          if (field_msg != undefined) {
          field_msg.className = "no-error";
          field.style.border = "none";
          }
   }

   /* accepts {'firstname':'value'} */
   function setElementToError(pr) {
          for (var i in pr) { field_name = i; }
          /*need to find alternate to getting hash keys */
          field = document.getElementById(field_name);          
          field_msg = document.getElementById(field_name + "_msg");
          field_msg.className = "error";
          field_msg.innerHTML = pr[field_name];
          field.style.border = "1px solid red";
   }

function advance_navigation(idx){
			clickable_btn = false;
			//clear_error();
			if(idx<list_elem_count-1){
				navigation_pos =  navigation_pos-20;
			}		
			animate_navigation(idx+1, navigation_pos);
}

	//Function to clear the errors on the form & navigation
	function clear_error(){
		$('#steps li').removeClass('error');
	}

	//Function to animate the clicked button  & the SVG icon
	function animate_navigation(btn_index, new_pos){
    var list_elem_count = document.querySelectorAll('#steps li').length;
		var s = Snap('.current_nav .arrow');

		s.stop().animate({'points' : svg_valid_icon}, 150, mina.easeout, function(){			
			if(btn_index<list_elem_count){
				
			/*	$(".arrow").velocity("fadeOut", {delay : 200, duration: 200, complete : function(){ */
					update_nav_position(btn_index, new_pos);
					$(this).eq(btn_index).css({"opacity" : 1});
					clickable_btn = true;
		/*		}}); */

			}else if(btn_index==list_elem_count){
				
				update_nav_position(btn_index, new_pos);

			}			
		});		
	}


	//Update the navigation position
	function update_nav_position(el_index, new_pos){
    var list_elem_count = $('#steps li').length;
		$('#2nav .vertab').eq(el_index).addClass('current')
		$('#2nav .vertab').eq(el_index-1).removeClass('current').addClass('previous');
		$('#2nav .icon2').eq(el_index-1).addClass('valid');
		$('#2nav .icon2').eq(el_index).addClass('current_nav')
    $('#2nav .icon2').eq(el_index-1).removeClass('current_nav');
		
		if(el_index <= list_elem_count-1){
			next_step(el_index);
			//focus_input(el_index);
		}
	}

	//Function to show the next step
	function next_step(idx){
    /*$("#steps li").eq(idx-1).velocity("fadeOut", {delay : 0, duration: 200, complete : function(){ */
		$('#steps li').eq(idx-1).removeClass('current_step');
		$('#steps li').eq(idx).addClass('current_step');
		update_progress(idx+1);
    /*}});*/
	}
function getn(elm){
url = 'http://naics.us/v0/s?year=2012&terms=' + elm.value;
resp = get_thirdparty(url);
return false;
}

   function get_thirdparty(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        eraseResults('naicslist');
        try { 
          var parsed_response = JSON.parse(response);
        } catch (err) {
        }
          if (!(typeof parsed_response === 'undefined')) {
          display_in_list(parsed_response);
          }
        return parsed_response;
        }, function(error) {
          console.error("Failed!", error);
        });
   }
   function eraseResults(obj){
     var myNode = document.getElementById(obj);
     while (myNode.firstChild) {
           myNode.removeChild(myNode.firstChild);
         }
   }

function display_in_list(resp){
    $('#naicslist').removeClass('hidden');
    eraseResults("naicslist");
    var length = resp.length
    for (var i = 0; i < length; i++) {

    var el = document.createElement('input');
    var lab = document.createElement('label');
    el.type = 'checkbox';
    el.id = 'radio' + i;
    el.value = resp[i]['code'] + ":" + resp[i]['title'];
    lab.htmlFor = 'radio' + i;
    lab.setAttribute('class','radio');
    lab.innerHTML = resp[i]['title'];

    document.getElementById("naicslist").appendChild(el);
    document.getElementById("naicslist").appendChild(lab);
  };
}
	function update_progress(idx){
		$('.step_nb').text(idx +'/'+list_elem_count);
	}
	function form_ready(){
    var form = document.getElementById('form');
    form.submit();
	}

function submitFunction(){
  url = generateSubmitUrl([],'submit');
  get_first(url);
  return false;
}

$(document).ready(function(){



	//Ckech mark SVG icon point
	var svg_valid_icon = "21.4,4.7 21.4,4.7 21.4,4.7 18.6,7.5 18.6,7.5 8.7,17.4 3,11.7 0,14.5 5.9,20.2 8.7,23 20.2,11.5 24.2,7.5";
	
	//Arrow SVG icon point
	var svg_arrow_icon = "17.4,8.7 17.4,8.7 8.7,0 5.9,2.8 14.6,11.5 8.7,17.4 8.8,17.3 5.8,20.1 5.9,20.2 8.7,23 20.2,11.5 20.2,11.5";
	
	//Form steps number
	var list_elem_count = $("#steps li").length;
	

	
	//Enable/Disable consecutive click/keypress event
	var clickable_btn = true;



	init();

	function init(){
    add_navigation();
		update_progress(1);
		focus_inupt(0);
	}

	//Click next step btn event
	$('#2nav li').on('click', function(e){		
		execute_event($(this).index());
	});	    

	//Click next step btn event
	$('#next').on('click', function(e){		
    var current_step_idx = $('#2nav li div.icon2').index(document.getElementsByClassName('current_nav')[0])
		execute_event(current_step_idx);
	});	    

	//Enter keybard press event
	$(document).on('keypress', function(e){
		var keyCode = e.keyCode || e.which
		if(keyCode === 13) {
      document.activeElement.blur();
      return false;
      var current_step_idx = $('#2nav li div.icon2').index(document.getElementsByClassName('current_nav')[0])
			execute_event(current_step_idx);
		}
	});

	//Function to start the animation
	function execute_event(idx){
    var current_step_idx = $('#2nav li div.icon2').index(document.getElementsByClassName('current_nav')[0])
    if(!clickable_btn) {
      return false;
    } else if (idx < current_step_idx) {
      jump_to_step(idx, current_step_idx);
      return false;
    } else if (!(current_step_idx == idx)){
			return false;
		}

		if(!validate_form(idx)){
			//show_error(idx);
			return false;
		}else{
			clickable_btn = false;
			clear_error();
			if(idx<list_elem_count-1){
				navigation_pos =  navigation_pos-20;
			}		
			animate_navigation(idx+1, navigation_pos);
      
      if(idx==list_elem_count-1){
      submitFunction();
      }
		}
	}





	//Function to validte the form
	function validate_form(step_index){
  var names = $.map($('#steps li').eq(step_index).find('input, select'), function (elm) { return elm.name; }) 
		/*if($('#steps li').eq(step_index).val() != ''){
			return true;
		}else{
			return false;
		}*/
    var s = submitPartialFunction(names);
    return s; 
	}

	//Function to focus on the form inputs
	function focus_inupt(input_idx){
		if($('#steps li input').length != 0){
			$('#steps li input').eq(input_idx).focus();
		}else{
			return false;
		}
	}


	//Function to add navigation
	function add_navigation(){
		if(list_elem_count==0){
			return false;
		}

		var icon_markup2 = '<div class="icon2" id="icon_wrapper"><svg x="0px" y="0px" width="24.3px" height="23.2px" viewBox="0 0 24.3 23.2" enable-background="new 0 0 24.3 23.2" xml:space="preserve"><polygon class="arrow" fill="#ffffff" points="'+ svg_arrow_icon +'"></svg></div>';
		
    $('#2nav .vertab').after(icon_markup2);
    $('#2nav .icon2').eq(0).addClass('current_nav');
	}


	//Function to show the next step
	function next_step(idx){
    /*$("#steps li").eq(idx-1).velocity("fadeOut", {delay : 0, duration: 200, complete : function(){ */
		$('#steps li').eq(idx-1).removeClass('current_step');
		$('#steps li').eq(idx).addClass('current_step');
		update_progress(idx+1);
    /*}});*/
	}

	function jump_to_step(idx, current_idx){
    /*$("#steps li").eq(idx-1).velocity("fadeOut", {delay : 0, duration: 200, complete : function(){ */
		$('#steps li').eq(current_idx).removeClass('current_step');
		$('#steps li').eq(idx).addClass('current_step');
		update_progress(idx+1);
    /*}});*/
	}


	//Function to show errors on the form & navigation
	function show_error(index){
		$('#navigation li').eq(index).addClass('error animate');
		$('#steps li').eq(index).addClass('error');
	}





	//Function to send the form or show a message
	function form_ready(){
		alert('Thanks for filling up the form!');
	}

	//Function to update step number(visible on small size screens)
	function update_progress(idx){
		$('.step_nb').text(idx +'/'+list_elem_count);
	}


});
