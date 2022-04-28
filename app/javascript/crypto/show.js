function getCrypto(id) {
  var xhr = new XMLHttpRequest();

  return new Promise((resolve, reject) => {

    xhr.onreadystatechange = (e) => {
      if (xhr.readyState !== 4) {
        return;
      }

      if (xhr.status === 200) {
        resolve(JSON.parse(xhr.responseText));
      } else {
        console.warn('request_error');
      }
    };

    xhr.open('GET', `/api/find/crypto/${id}`, false);
    xhr.send();
  });
}

document.addEventListener('turbolinks:load', () => {

  let api_data = [];

  fetch("/api/holdings")
.then(response => response.json())
.then((holding_data) => {
  holding_data.forEach(function(holding) {
    getCrypto(holding.crypto_id)
    .then(crypto => {
      api_data.push({name: crypto.name, y: holding.quantity});
      if (document.getElementById('pie-container') == undefined)
        return;
      Highcharts.chart('pie-container', {
        chart: {
          type: 'variablepie',
          backgroundColor: 'rgb(68, 100, 246)'
        },
        title: {
          text: ''
        },
        tooltip: {
          headerFormat: ''
        },
        credits: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        tooltip: {
            enabled: false
        },
        plotOptions: {
            variablepie: {
              borderWidth: 0
            },
              series: {
                states: {
                  hover: {
                    enabled: false
                },
                inactive: {
                  opacity: 1
                }
              }
            },
          },
        series: [{
          minPointSize: 0,
          maxPointSize: 1,
          innerSize: '50%',
          data: api_data,
          dataLabels: {
            style: {
              color: 'white',
              textOutline: null
            }
          },
        }]
      });
    })
  })
});


  const ctx = document.getElementById('myChart');
  const coin = document.getElementById('crypto');

  if (ctx && coin) {
  fetch(`https://min-api.cryptocompare.com/data/v2/histohour?fsym=${coin.value}&tsym=USD&limit=200&api_key=44440364318a309f946bc339a30b03b37891c415f82505b6a7ea010855cbdde6`)
  .then(response => response.json())
  .then((data) => {
    const data2 = data.Data.Data;
    const times = data2.map(obj => obj.time);
    const prices = data2.map(obj => obj.high);

    console.log(times.map(obj => (new Date(obj * 1000).getHours()).toString() + ":00"));

    const myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: times.map(obj => (new Date(obj * 1000).getHours()).toString() + ":00"),
          datasets: [{
              label: '$',
              data: prices,
              backgroundColor: 'rgba(255, 99, 132, 0.2)',
              borderColor: 'rgba(105, 255, 100, 1)',
              borderJoinStyle: 'round',
              borderCapStyle: 'round',
              borderWidth: 3,
              pointRadius: 0,
              pointHitRadius: 10,
              lineTension: .2,
          }]
      },
      options: {
        title: {
          display: true,
          text: `${coin.name} 1d chart`,
        },
        plugins: {
          legend: false,
        },
        layout: {
          padding: {
            left: 0,
            right: 0,
            top: 0,
            bottom: 0
          }
        },
          scales: {
              y: {
                  display: true,
                  gridLines: {},
                  beginAtZero: false
              },
              x: {
                display: true,
                gridLines: {}
              }
          }
      }
  });

  })
  }
});
