@Record = React.createClass
  render: ->
    R = React.DOM
    R.tr null,
      R.td null, @props.record.date
      R.td null, @props.record.title
      R.td null, amountFormat(@props.record.amount)
