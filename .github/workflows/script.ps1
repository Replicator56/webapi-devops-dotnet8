$API_KEY = "12345-FAKE-SECRET"
Invoke-RestMethod -Uri "https://httpbin.org/get" -Headers @{ Authorization = "Bearer $API_KEY" }
echo $API_KEY