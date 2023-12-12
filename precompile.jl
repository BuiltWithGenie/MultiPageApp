
using GenieFramework
using HTTP
Genie.loadapp()
up(async=true)
HTTP.get("http://localhost:8000/");
HTTP.get("http://localhost:8000/eda");
HTTP.get("http://localhost:8000/ml");
HTTP.get("http://localhost:8000/api");
