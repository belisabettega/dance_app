function listenToCreateSlot(){
  const timeSlice = document.querySelectorAll('.slice');
  if(timeSlice){
    $('.slice').on('click', function(){
      const arrayDate = $(this).parent().attr("class").split(/\s+/)[1].split('');
      const day = parseInt(arrayDate[0] + arrayDate[1], 10);
      const monthIndex = parseInt(arrayDate[2] + arrayDate[3], 10) - 1;
      const year = parseInt(arrayDate[4] + arrayDate[5] + arrayDate[6] + arrayDate[7] , 10);
      const arrayHour = $(this).attr("class").split(/\s+/)[1].split('');
      const hour = parseInt(arrayHour[0] + arrayHour[1], 10);
      const minute = parseInt(arrayHour[2] + arrayHour[3], 10);
      const dateObject = new Date(year, monthIndex, day, hour, minute, 0);
      const dateWithCorrectTimezone = dateObject.toLocaleString("en-GB", {timeZone: "Europe/London"});
      $.ajax({
        method: "POST",
        url: "slots",
        data: { date: dateWithCorrectTimezone }
      });
    });
  }
}

function listenToReserveSlot(){
  const reserveLink = document.querySelectorAll('.reserve-link');
  if(reserveLink){
    $('.reserve-link').on('click', function(){
      const slotId = $(this).parent().attr('data-id');
      $.ajax({
        method: "PATCH",
        url: 'slots/' + slotId + '/reserve'
      });
    });
  }
}

function listenToDeleteSlot(){
  const deleteLink = document.querySelectorAll('.delete-slot');
  if(deleteLink){
    $('.delete-slot').on('click', function(){
      const slotId = $(this).parent().attr('data-id');
      $.ajax({
        method: "DELETE",
        url: 'slots/' + slotId
      });
    });  
  }
}

function listenToUnreserveSlot(){
  const unreserveLink = document.querySelectorAll('.unreserve-link');
  if(unreserveLink){
    $('.unreserve-link').on('click', function(){
      const slotId = $(this).parent().attr('data-id');
      $.ajax({
        method: "PATCH",
        url: 'slots/' + slotId + '/bookable'
      });
    });
  }
}

function listenToChangeDurationOfSlot(){
  const updateDurationLink = document.querySelectorAll('.duration-box');
  if(updateDurationLink){
    $('.duration-box').on('click', function(){
      const slotId = $(this).parent().parent().attr('data-id');
      const duration = $(this)[0].textContent;
      $.ajax({
        method: "PATCH",
        url: 'slots/' + slotId,
        data: { duration: duration }
      });
    });
  }
}


function calendarListener() {
  const closeIcon = document.querySelectorAll('.close');

  const futureEvents = document.querySelectorAll('.td.day');
  
  listenToCreateSlot();
  listenToReserveSlot();
  listenToDeleteSlot();
  listenToUnreserveSlot();
  listenToChangeDurationOfSlot();


  $('.calendar-entry').on('click', function(){
    console.log('hello entry');
    // User query selector for the day and the hour of the calendar entry (available in data attributtes) - to find the slice
    // use the class of the html I want to put in front of the slice to store the new html
    // change the html from the slice to the new one
  });

  

 
};

export { calendarListener };