javascript:(function() {  var links = document.getElementsByTagName('a');  var domainSet = new Set();  var ignoredDomains = ['google.com', 'google.es', 'googleusercontent.com', 'googleapis.com'];  for (var i = 0; i < links.length; i++) {    var url = links[i].href;    var ignore = false;    for (var j = 0; j < ignoredDomains.length; j++) {      if (url.includes(ignoredDomains[j])) {        ignore = true;        break;      }    }    if (!ignore) {      try {        var urlObject = new URL(url);        domainSet.add(urlObject.hostname);      } catch (error) {        console.error('Error al analizar la URL: ' + url);      }    }  }  var uniqueDomains = Array.from(domainSet);  var domainList = uniqueDomains.join('\n');  var totalUniqueDomains = uniqueDomains.length;  var newTab = window.open();  newTab.document.open();  newTab.document.write('<pre>Nº de URLs diferentes: ' + totalUniqueDomains + '\n' + domainList + '</pre>');  newTab.document.close();})();