@Record = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record

  render: ->
    R = React.DOM
    R.tr null,
      R.td null, @props.record.date
      R.td null, @props.record.title
      R.td null, amountFormat(@props.record.amount)
      R.td null,
        R.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
