 # app/assets/javascripts/components/records.js.coffee

@Records = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  addRecord: (record) ->
      records = @state.records.slice()
      records.push record
      @setState records: records

  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  balance: ->
    @credits() + @debits()

  render: ->
    R = React.DOM
    R.div
      className: 'records'
      R.h2
        className: 'title'
        'Records'
      R.div
        React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credit'
        React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debit'
        React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
      React.createElement RecordForm,
        handleNewRecord: @addRecord
      R.hr null
      R.table
        className: 'table table-bordered'
        R.thead null,
          R.tr null,
            R.th null, 'Date'
            R.th null, 'Title'
            R.th null, 'Amount'
        R.tbody null
          for record in @state.records
            # TODO: Bug here, newly added record gets inserted outside of the tbody tag
            console.log "adding record === #{JSON.stringify(record)}"
            React.createElement Record, key: record.id, record: record
