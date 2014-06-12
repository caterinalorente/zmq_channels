describe 'Addition', ->
  it 'should add 1+1 correctly', (done) ->
    onePlusOne = 1 + 1
    onePlusOne.should.equal(2)
    done()