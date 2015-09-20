 # app/assets/javascripts/components/records.js.coffee

@Records = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  addRecord: (record) ->
    # records = @state.records.slice()
    # records.push record
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records

  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
    @replaceState records: records

  deleteRecord: (record) ->
    # records = @state.records.slice()
    # index = records.indexOf record
    # records.splice index, 1
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1]] })
    @replaceState records: records

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
        'Accounts Tracker'
      R.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @credits(), text: 'CREDIT'
        React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'DEBIT'
        React.createElement AmountBox, type: 'info', amount: @balance(), text: 'BALANCE'
      R.div
        className: 'account-form'
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
            R.th null, 'Actions'
        R.tbody null,
          for record in @state.records
            # TODO: Bug here, newly added record gets inserted outside of the tbody tag
            React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord
