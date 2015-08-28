require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/bands') do
  name = params.fetch("band_name")
  city = params.fetch("band_city") 
  state = params.fetch("state")
  band = Band.new({:name => name, :city => city, :state => state})
  if band.save()
   redirect("/")
  else
   erb(:errors)
 end
end

post('/venues') do
  name = params.fetch("venue_name")
  city = params.fetch("venue_city") 
  venue = Venue.new({:name => name, :city => city})
  if venue.save()
   redirect("/")
  else
   erb(:errors)
 end
end

get('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  erb(:bands)
end


get('/bands/:id/edit') do
 @band = Band.find(params.fetch('id'))
 erb(:band_edit)
end

patch('/bands/:id/name') do
  @band = Band.find(params.fetch('id'))
  name = params.fetch("name")
  @band.update({:name => name})
  redirect("/bands/#{@band.id}")
end

patch('/bands/:id/city') do
  @band = Band.find(params.fetch('id'))
  city = params.fetch("city") 
  @band.update({:city => city})
  redirect("/bands/#{@band.id}")
end

patch('/bands/:id/state') do
  @band = Band.find(params.fetch('id'))
  state = params.fetch("state")
  @band.update({:state => state})
  redirect("/bands/#{@band.id}")
end

delete('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  @band.destroy()
  redirect("/")
end

#==============================================================#


