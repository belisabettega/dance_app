function calendarListener() {
  const closeIcon = document.querySelectorAll('.close');

  const futureEvents = document.querySelectorAll('.td.day');
  

  $('.slice').on('click', function(){
    const arrayDate = $(this).parent().attr("class").split(/\s+/)[1].split('');
    const day = parseInt(arrayDate[0] + arrayDate[1], 10);
    const month = parseInt(arrayDate[2] + arrayDate[3], 10);
    const year = parseInt(arrayDate[4] + arrayDate[5] + arrayDate[6] + arrayDate[7] , 10);
    const arrayHour = $(this).attr("class").split(/\s+/)[1].split('');
    const hour = parseInt(arrayHour[0] + arrayHour[1], 10);
    const minute = parseInt(arrayHour[2] + arrayHour[3], 10);
    const dateObject = new Date(year, month, day, hour, minute, 0);
    $.ajax({
      method: "POST",
      url: "slots",
      data: { date: dateObject }
    });

  });

  $('.calendar_entry').on('click', function(){
    console.log('hello entry');
    // User query selector for the day and the hour of the calendar entry (available in data attributtes) - to find the slice
    // use the class of the html I want to put in front of the slice to store the new html
    // change the html from the slice to the new one
  });
};

export { calendarListener };