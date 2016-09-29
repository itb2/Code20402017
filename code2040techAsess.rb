________________Step1________________________________________________________________

require "http"

#My API Token: 8eacb8876d3324b2748d6f649cc15770
#Github: https://github.com/itb2/Code20402017.git
#reg endpoint: http://challenge.code2040.org/api/register

response = HTTP.post("http://challenge.code2040.org/api/register", :json => {
   :token => "8eacb8876d3324b2748d6f649cc15770",
   :github => "https://github.com/itb2/Code20402017.git"
})

puts response.body.to_s


_________________Step 2______________________________________________________________
require "http"

response = HTTP.post("http://challenge.code2040.org/api/reverse", :json => {
   :token => "8eacb8876d3324b2748d6f649cc15770"
})
response = response.body.to_s
result = result.reverse

validate = HTTP.post("http://challenge.code2040.org/api/reverse/validate", :json => {
  :token => "8eacb8876d3324b2748d6f649cc15770",
  :string => result
})

_________________Step 3______________________________________________________________
require "http"

response = HTTP.post("http://challenge.code2040.org/api/haystack", :json => {
   :token => "8eacb8876d3324b2748d6f649cc15770"
})

hash = JSON.parse(response.body.to_s)
vals = hash.values


needle = vals[0]
hay = vals[1]

result = hay.index(needle)

validate = HTTP.post("http://challenge.code2040.org/api/haystack/validate", :json => {
  :token => "8eacb8876d3324b2748d6f649cc15770",
  :needle => result
})

puts validate.body.to_s

_________________Step 4_____________________________________________________________
require "http"

response = HTTP.post("http://challenge.code2040.org/api/prefix", :json => {
   :token => "8eacb8876d3324b2748d6f649cc15770"
})

dict = JSON.parse(response.body.to_s)

vals = dict.values

prefix = vals[0]
array = vals[1]
len = prefix.length
ary = Array.new
array.each do |x|
        if x[0,len] != prefix
                ary.push(x)
        end
end


validate = HTTP.post("http://challenge.code2040.org/api/prefix/validate", :json => {
  :token => "8eacb8876d3324b2748d6f649cc15770",
  :array => ary
})

puts validate.body.to_s

_________________Step 5______________________________________________________________
require "http"


response = HTTP.post("http://challenge.code2040.org/api/dating", :json => {
   :token => "8eacb8876d3324b2748d6f649cc15770"
})

dict = JSON.parse(response.body.to_s)

vals = dict.values
interval = vals[1]

time = Time.parse(vals[0])

future_time = time + interval
future_time = future_time.to_s
future_time = future_time.split(" ")

datestring = future_time[0]+ "T" + future_time[1]+"Z"



validate = HTTP.post("http://challenge.code2040.org/api/dating/validate", :json => {
  :token => "8eacb8876d3324b2748d6f649cc15770",
  :datestamp=> datestring
})

puts validate.body.to_s
