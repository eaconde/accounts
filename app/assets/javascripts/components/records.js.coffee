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
  render: ->
    R = React.DOM
    R.div
      className: 'records'
      R.h2
        className: 'title'
        'Records'
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
