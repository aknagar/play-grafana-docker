# Running application
* Open the folder in Visaul Studio code.
* set the terminal folder to the directory containing Gruntfile.js
* Run `npm install`
* Run `grunt`
* *dist* folder get created which contains plugin.json and module.js which are the most important file
* Copy & past the dist folder in grafana server at /data/plugins (in windows) or /var/lib/grafana/plugins(in linux)
* Restart the server
* Browser the grafan url