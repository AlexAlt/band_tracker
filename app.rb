require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/bands') do
  name = params.fetch("name")
  hometown = params.fetch("hometown")
  band = Band.create({:name => name, :hometown => hometown})
  @bands = Band.all()
  redirect("/")
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

patch('/bands/:id/hometown') do
  @band = Band.find(params.fetch('id'))
  hometown = params.fetch("hometown")
  @band.update({:hometown => hometown})
  redirect("/bands/#{@band.id}")
end