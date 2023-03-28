var RNB_CALENDER_ACTION = {};
jQuery(document).ready(function ($) {
  const weekDaysAra = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
  const dateTimeOptions = {};
  const dropDateTimeOptions = {};

  timeConvert = (time) => {
    if (time === '24:00') {
      return '11:59 pm';
    }
    time = time
      .toString()
      .match(/^([01]\d|2[0-3])(:)([0-5]\d)(:[0-5]\d)?$/) || [time];
    if (time.length > 1) {
      time = time.slice(1);
      time[5] = +time[0] < 12 ? ' am' : ' pm';
      time[0] = +time[0] % 12 || 12;
    }
    return time.join('');
  };

  getBlockDates = (CALENDAR_DATA) => {
    let dates = [];
    if (CALENDAR_DATA.buffer_days) {
      const allDates = CALENDAR_DATA.block_dates.concat(
        CALENDAR_DATA.buffer_days
      );
      dates = allDates.filter((v, i, a) => a.indexOf(v) === i);
    }
    return dates;
  };

  rnb_handle_time_restriction = (
    conditional_data,
    validation_data,
    currentDateTime,
    calendarDate
  ) => {
    let opening_closing = validation_data.openning_closing;
    const opening_closing_copy = clone(opening_closing);

    let euroFormat = conditional_data.euro_format;
    let selectedDay;
    let selectedDate;

    if (euroFormat === 'yes') {
      const splitDate = calendarDate.split('/');
      const finalDate = `${splitDate[1]}/${splitDate[0]}/${splitDate[2]}`;
      selectedDay = new Date(finalDate).getDay();
      selectedDate = new Date(finalDate).getDate();
    } else {
      selectedDay = new Date(calendarDate).getDay();
      selectedDate = new Date(calendarDate).getDate();
    }

    // Checking for todays min time
    const getToday = currentDateTime.getDay();
    const todayMinTime =
      conditional_data.time_format === '24-hours'
        ? currentDateTime.toLocaleString('en-US', {
            hour: 'numeric',
            minute: 'numeric',
            hour12: false,
          })
        : currentDateTime.toLocaleString('en-US', {
            hour: 'numeric',
            minute: 'numeric',
            hour12: true,
          });

    if (currentDateTime.getDate() === selectedDate) {
      opening_closing[weekDaysAra[getToday]].min = todayMinTime;
    } else {
      opening_closing = opening_closing_copy;
    }

    return [selectedDay, opening_closing];
  };

  mobileCalendarCloseBtn = (args) => {
    $(args.closeButtonId).on('click', function () {
      $(args.modalBodyId).hide();
      $(args.dateId).datetimepicker('destroy');
    });
  };

  rnbHandleMobileSubmitEvent = (
    params,
    dateOptions,
    dateTimeOptions,
    timeOptions
  ) => {
    $(params.elementId).on('click', function () {
      $(params.modalBodyId).hide();
      $(params.dateId).datetimepicker('destroy');
      $(params.dateId).datetimepicker(
        Object.assign(dateOptions, {
          value: dateTimeOptions['date'],
        })
      );
      $(params.timeId).datetimepicker(timeOptions);
      $('form.cart').trigger('change');
      $(params.dateId).datetimepicker('destroy');
    });
  };

  /**
   * calendarInit
   *
   */
  function calendarInit(CALENDAR_DATA) {
    const conditional_data = CALENDAR_DATA.calendar_props.settings.conditions;
    const general_data = CALENDAR_DATA.calendar_props.settings.general;
    const validation_data = CALENDAR_DATA.calendar_props.settings.validations;

    /**
     * Configuration of time picker for pickup time
     *
     * @since 1.0.0
     * @return null
     */
    let opening_closing = validation_data.openning_closing;
    const opening_closing_copy = clone(opening_closing);

    // end new code

    const OpeningClosingTimeLogic = function (currentDateTime) {
      const pickupDate = $('#pickup-date').val();
      const results = rnb_handle_time_restriction(
        conditional_data,
        validation_data,
        currentDateTime,
        pickupDate
      );

      const selectedDay = results[0];
      const opening_closing = results[1];
      this.setOptions({
        minTime:
          conditional_data.time_format === '24-hours'
            ? opening_closing[weekDaysAra[selectedDay]].min
            : timeConvert(opening_closing[weekDaysAra[selectedDay]].min),
        maxTime:
          conditional_data.time_format === '24-hours'
            ? opening_closing[weekDaysAra[selectedDay]].max
            : timeConvert(opening_closing[weekDaysAra[selectedDay]].max),
        format: conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
        formatTime:
          conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
      });
    };

    const DropOffOpeningClosingTimeLogic = function (currentDateTime) {
      let minsToAdd;
      let time;
      const dropoffDate = $('#dropoff-date').val()
        ? $('#dropoff-date').val()
        : $('#pickup-date').val();
      const results = rnb_handle_time_restriction(
        conditional_data,
        validation_data,
        currentDateTime,
        dropoffDate
      );
      const selectedDay = results[0],
        opening_closing = results[1];

      let minTime;

      if ($('#dropoff-date').length > 0) {
        if ($('#pickup-date').val() === $('#dropoff-date').val()) {
          if ($('#pickup-time').val() !== '') {
            time = $('#pickup-time').val();
            minsToAdd = conditional_data.time_interval;

            minTime = new Date(
              new Date('1970/01/01 ' + time).getTime() + minsToAdd * 60000
            )
              .toLocaleTimeString('en-US', {
                hour: 'numeric',
                hour12:
                  conditional_data.time_format === '24-hours' ? false : true,
                minute: 'numeric',
              })
              .replace('AM', 'am')
              .replace('PM', 'pm');
          }
        }
      } else {
        if ($('#pickup-time').val() !== '') {
          time = $('#pickup-time').val();
          minsToAdd = conditional_data.time_interval;

          minTime = new Date(
            new Date('1970/01/01 ' + time).getTime() + minsToAdd * 60000
          )
            .toLocaleTimeString('en-US', {
              hour: 'numeric',
              hour12:
                conditional_data.time_format === '24-hours' ? false : true,
              minute: 'numeric',
            })
            .replace('AM', 'am')
            .replace('PM', 'pm');
        }
      }

      this.setOptions({
        minTime:
          minTime !== undefined
            ? minTime
            : conditional_data.time_format === '24-hours'
            ? opening_closing[weekDaysAra[selectedDay]].min
            : timeConvert(opening_closing[weekDaysAra[selectedDay]].min),
        maxTime:
          conditional_data.time_format === '24-hours'
            ? opening_closing[weekDaysAra[selectedDay]].max
            : timeConvert(opening_closing[weekDaysAra[selectedDay]].max),
        format: conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
        formatTime:
          conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
      });
    };

    const onShow = function (ct) {
      $('#dropoff-date').val('');
      this.setOptions({
        minDate: 0,
        disabledDates: final,
      });
    };

    const onSelectDate = function (ct, $i) {
      const allowedTimes = CALENDAR_DATA.allowed_datetime;
      dateTimeOptions['date'] = ct;
      dropDateTimeOptions['date'] = ct;
      if (
        allowedTimes[ct.dateFormat(conditional_data.date_format)] !== undefined
      ) {
        if (
          allowedTimes[ct.dateFormat(conditional_data.date_format)].length === 0
        ) {
          ['#pickup-time', '#dropoff-time'].forEach((elementId) => {
            $(elementId).datetimepicker({
              datepicker: false,
              timepicker: false,
            });
          });
        } else {
          ['#pickup-time', '#dropoff-time'].forEach((elementId) => {
            $(elementId).datetimepicker({
              datepicker: false,
              format:
                conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
              formatTime:
                conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
              allowTimes:
                allowedTimes[ct.dateFormat(conditional_data.date_format)],
            });
          });
        }
      } else {
        ['#pickup-time', '#dropoff-time'].forEach((elementId) => {
          $(elementId).datetimepicker('destroy');
          $(elementId).datetimepicker({
            datepicker: false,
            format:
              conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
            formatTime:
              conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
            step: conditional_data.time_interval
              ? parseInt(conditional_data.time_interval)
              : 5,
            scrollInput: false,
            onShow:
              elementId === '#pickup-time'
                ? OpeningClosingTimeLogic
                : DropOffOpeningClosingTimeLogic,
            allowTimes: conditional_data.allowed_times,
          });
        });
      }
    };

    let offDays = [];
    /**
     * Configure weekend
     */
    if (conditional_data.weekends !== undefined) {
      const offDaysLength = conditional_data.weekends.length;
      for (let i = 0; i < offDaysLength; i++) {
        offDays.push(parseInt(conditional_data.weekends[i]));
      }
    }

    let domain =
      general_data.lang_domain !== false ? general_data.lang_domain : 'en';
    $.datetimepicker.setLocale(domain);

    /**
     * Configuration of date picker for pickup date
     *
     * @since 1.0.0
     * @return null
     */
    $('#pickup-date').change(function (e) {
      $('#pickup-time').val('');
      $('#dropoff-time').val('');
    });

    /**
     * Configuration of time picker for dropoff date
     *
     * @since 1.0.0
     * @return null
     */
    $('#dropoff-date').change(function (e) {
      $('#dropoff-time').val('');
    });

    const final = getBlockDates(CALENDAR_DATA);
    const calendarOptions = {
      timepicker: false,
      scrollMonth: false,
      dayOfWeekStart: general_data.day_of_week_start
        ? general_data.day_of_week_start
        : 0,
      format: conditional_data.date_format,
      minDate: 0,
      disabledDates: final,
      formatDate: conditional_data.date_format,
      disabledWeekDays: offDays,
      scrollInput: false,
    };

    const datepickerOption = Object.assign({}, calendarOptions, {
      onShow: onShow,
      onSelectDate: onSelectDate,
    });
    const mobilePickupDatePickerOptions = Object.assign({}, datepickerOption, {
      inline: true,
      onSelectTime: function (ct) {
        dateTimeOptions['time'] = ct;
      },
    });

    const dropDatepickerOption = Object.assign({}, calendarOptions, {
      onShow: function (ct) {
        this.setOptions({
          minDate: $('#pickup-date').val() ? $('#pickup-date').val() : 0,
          disabledDates: final,
        });
      },
      onSelectDate: onSelectDate,
    });
    const mobileDropoffDatePickerOptions = Object.assign(
      {},
      dropDatepickerOption,
      {
        inline: true,
        // onSelectDate: function(ct) {
        //   dropDateTimeOptions['date'] = ct;
        // },
        disabledWeekDays: offDays,
        onSelectTime: function (ct) {
          dropDateTimeOptions['time'] = ct;
        },
        scrollInput: true,
      }
    );

    if (window.innerWidth <= 480) {
      const mobileTimeOptions = {
        format: conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
        formatTime:
          conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
      };
      const mobilePickupTimeOptions = Object.assign({}, mobileTimeOptions, {
        value: dateTimeOptions['time'],
      });
      const mobileDropoffTimeOptions = Object.assign({}, mobileTimeOptions, {
        value: dropDateTimeOptions['time'],
      });
      const elementIds = {
        pickup: {
          elementId: '#cal-submit-btn',
          closeButtonId: '#cal-close-btn',
          modalBodyId: '#pickup-modal-body',
          dateId: '#pickup-date',
          timeId: '#pickup-time',
        },
        dropoff: {
          elementId: '#drop-cal-submit-btn',
          closeButtonId: '#drop-cal-close-btn',
          modalBodyId: '#dropoff-modal-body',
          dateId: '#dropoff-date',
          timeId: '#dropoff-time',
        },
      };

      $('#pickup-date').datetimepicker('destroy');

      //Start
      $('#pickup-date').on('click', function () {
        $(elementIds.pickup.modalBodyId).show();
        $('#mobile-datepicker').datetimepicker(mobilePickupDatePickerOptions);
        mobileCalendarCloseBtn(elementIds.pickup);
        rnbHandleMobileSubmitEvent(
          elementIds.pickup,
          datepickerOption,
          dateTimeOptions,
          mobilePickupTimeOptions
        );
      });

      //dropoff
      $('#dropoff-date').on('click', function () {
        const minDate = $('#pickup-date').val() ? $('#pickup-date').val() : 0;
        $(elementIds.dropoff.modalBodyId).show();
        $('#drop-mobile-datepicker').datetimepicker(
          mobileDropoffDatePickerOptions
        );
        mobileCalendarCloseBtn(elementIds.dropoff);
        rnbHandleMobileSubmitEvent(
          elementIds.dropoff,
          dropDatepickerOption,
          dropDateTimeOptions,
          mobileDropoffTimeOptions
        );
        //End
      });
    } else {
      $('#pickup-date').datetimepicker('destroy');
      $('#pickup-date').datetimepicker(datepickerOption);
      $('#dropoff-date').datetimepicker('destroy');
      $('#dropoff-date').datetimepicker(dropDatepickerOption);

      //Check for url dates
      if (RNB_URL_DATA.date) {
        const elementIds = ['#pickup-time', '#dropoff-time'];
        elementIds.forEach((elementId) => {
          $(elementId).datetimepicker('destroy');
          $(elementId).datetimepicker({
            datepicker: false,
            format:
              conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
            formatTime:
              conditional_data.time_format === '24-hours' ? 'H:i' : 'h:i a',
            step: conditional_data.time_interval
              ? parseInt(conditional_data.time_interval)
              : 5,
            scrollInput: false,
            onShow:
              elementId === '#pickup-time'
                ? OpeningClosingTimeLogic
                : DropOffOpeningClosingTimeLogic,
            allowTimes: conditional_data.allowed_times,
          });
        });
      }
    }
    //End
  }

  RNB_CALENDER_ACTION = {
    init: calendarInit,
  };
});
