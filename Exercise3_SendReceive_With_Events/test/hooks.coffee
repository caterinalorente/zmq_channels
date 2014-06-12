describe 'test the order of Mocha hooks', ->
  before -> console.log 'before'
  after -> console.log 'after'
  beforeEach -> console.log 'beforeEach'
  afterEach -> console.log 'afterEach'

  it 'test 1', -> console.log '1'
  it 'test 2', -> console.log '2'