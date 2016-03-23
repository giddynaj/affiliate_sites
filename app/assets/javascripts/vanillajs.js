var url = "";
    
function generateSubmitUrl(){
  var form = document.getElementById("form");
  var url = ""
  for (i = 0; i < form.elements.length; i++) {
    var elm = form.elements[i];
      url += elm.id + "=" + elm.value + "&";
    }
  url = form.action + "?" + url + 'type=submit';
return url;
}
function generateEventUrl(obj){
  var url = obj.name + "=" + obj.value + "&";
  url = form.action + "?" + url + 'type=event';
return url;
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

function sort_children(sortby){
  var list = document.getElementById('list');

  var items = list.childNodes;
  var itemsArr = [];
  for (var i in items) {
    if (items[i].nodeType == 1) { // get rid of the whitespace text nodes
      itemsArr.push(items[i]);
    }
  }

  itemsArr.sort(function(a, b) {
    return a.getElementsByClassName(sortby)[0].innerHTML == b.getElementsByClassName(sortby)[0].innerHTML
    ? 0
    : (a.getElementsByClassName(sortby)[0].innerHTML > b.getElementsByClassName(sortby)[0].innerHTML ? 1 : -1);
  });

  for (i = 0; i < itemsArr.length; ++i) {
    list.appendChild(itemsArr[i]);
  }
}


function addToTemplate(obj){
  obj.forEach(function(car) {

    var template = document.getElementById("my-template").innerHTML,
    el = document.createElement('div');

    el.innerHTML = template;

    el.getElementsByClassName("car-name")[0].innerHTML += car.active_car.make.name + " " + car.active_car.model.name;
    el.getElementsByClassName("car-image")[0].innerHTML +=  "<image src=\"http://images.motovy.com/carimage/" + car.active_car.cars_id + "/thumb/0.jpg\" style=\"position:relative; min-width:auto; height:auto; width:100px; \" />";
    el.getElementsByClassName("car-price")[0].innerHTML += car.active_car.price;
    el.getElementsByClassName("car-year")[0].innerHTML += car.active_car.year;
    el.getElementsByClassName("car-miles")[0].innerHTML += car.active_car.miles;
    el.getElementsByClassName("car-location")[0].innerHTML += car.active_car.zip_code.city + " " + car.active_car.zip_code.state;
    el.getElementsByClassName("car-truebook")[0].innerHTML += car.active_car.truebook_value_array[1] ;
    el.getElementsByClassName("car-link")[0].innerHTML += "<a href=\"/cars/" +  car.active_car.cars_id + "\">Link</a>" ;
    

    document.getElementById("list").appendChild(el);
  });
}

function addToDropdown(obj){
  obj.forEach(function(car) {

    var el = document.createElement('option');
    el.value = car.display_model.id;
    el.innerHTML = car.display_model.name;

    document.getElementById("display_model_id").appendChild(el);
  });
}

   function get_more(){
    page_count += 1;
    url += "&page=" + page_count;
    get(url).then(function(response) {
        console.log("Success!", response);
        addToTemplate(JSON.parse(response));
        }, function(error) {
          console.error("Failed!", error);
        });
   }
   function get_models(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        eraseResults('display_model_id');
        addToDropdown(JSON.parse(response).models);
        }, function(error) {
          console.error("Failed!", error);
        });
   }
   function get_first(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        eraseResults('list');
        try { 
          var parsed_response = JSON.parse(response);
        } catch (err) {
        }
        window.location = parsed_response.url;
        }, function(error) {
          console.error("Failed!", error);
        });
   }

   function get_thirdparty(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        eraseResults('list');
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

   function send_event(url){
    get(url).then(function(response) {
        console.log("Success!", response);
        eraseResults('list');
        try { 
          var parsed_response = JSON.parse(response);
        } catch (err) {
        }
          console.log(parsed_response);
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

function submitFunction(){
  url = generateSubmitUrl();
  get_first(url);
  return false;
}

function cycle(direction){
  //#move on to next field
  if (fields.length < (current_field_index + 1)) {
    current_field_index += 1;
  } 
  return false;
}
  
function getn(elm){
url = 'http://naics.us/v0/s?year=2012&terms=' + elm.value;
resp = get_thirdparty(url);
return false;
}

function display_in_list(resp){
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

function changed(obj){
url = generateEventUrl(obj);
send_event(url);
console.log(obj);
}

var page_count = 0;

