function positionSlots(){
  const existingSlots = $('.calendar-entry');
  if(existingSlots){
    existingSlots.each(function(){
      const date = $(this).data('day');
      const hour = $(this).data('hour');
      const duration = $(this).data('duration-number');
      const daySlotsList = $('#' + date);
      const listElementHour = daySlotsList.find('.' + hour);
      const listElementPlus15 = listElementHour.next('li');
      listElementPlus15.hide();
      const listElementPlus30 = listElementPlus15.next('li');
      listElementPlus30.hide();
      const listElementPlus45 = listElementPlus30.next('li');
      listElementPlus45.hide();
      if(duration == '6'){
        const listElementPlus60 = listElementPlus45.next('li');
        listElementPlus60.hide();
        const listElementPlus75 = listElementPlus60.next('li');
        listElementPlus75.hide();
      }
      if(duration == '8'){
        const listElementPlus60 = listElementPlus45.next('li');
        listElementPlus60.hide();
        const listElementPlus75 = listElementPlus60.next('li');
        listElementPlus75.hide();
        const listElementPlus90 = listElementPlus75.next('li');
        listElementPlus90.hide();
        const listElementPlus105 = listElementPlus90.next('li');
        listElementPlus105.hide();
      }
      listElementHour.replaceWith($(this)[0]);
    });
  }
}

function listenToCreateSlot(){
  const timeSlice = document.querySelectorAll('.slice');
  if(timeSlice){
    $('.slice').on('click', function(){
      let arrayDate = $(this).parent().attr("id").split('');
      if(arrayDate.length == 7) {
        arrayDate.unshift('0');
      }
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

function listenToBookClass(){
  const bookClassLink = document.querySelectorAll('.book-link');
  if(bookClassLink){
    $('.book-link').on('click', function(){
      let slotId = $(this).data('id');
      let slotDate = $(this).data('date');
      $('.modal-title').html(slotDate);
      $('input#booking_id').val(slotId);
      $('#bookClass').modal('show');
    });
  }
}

function calendarListener() {
  
  positionSlots();
  listenToCreateSlot();
  listenToReserveSlot();
  listenToDeleteSlot();
  listenToUnreserveSlot();
  listenToChangeDurationOfSlot();
  listenToBookClass();
 
};

export { calendarListener };