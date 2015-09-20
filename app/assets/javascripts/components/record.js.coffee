@Record = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: React.findDOMNode(@refs.title).value
      date: React.findDOMNode(@refs.date).value
      amount: React.findDOMNode(@refs.amount).value
    $.ajax
      method: 'PUT'
      url: "records/#{ @props.record.id }"
      dataType: 'JSON'
      data:
        record: data
      success: (data) =>
        @setState edit: false
        @props.handleEditRecord @props.record, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record

  recordRow: ->
    R = React.DOM
    R.tr null,
      R.td null, @props.record.date
      R.td null, @props.record.title
      R.td
        className: 'text-right'
        amountFormat(@props.record.amount)
      R.td
        className: 'row'
        R.a
          className: 'btn btn-default col-xs-6'
          onClick: @handleToggle
          'Edit'
        R.a
          className: 'btn btn-danger col-xs-6'
          onClick: @handleDelete
          'Delete'

  recordForm: ->
    R = React.DOM
    R.tr null,
      R.td null,
        R.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.date
          ref: 'date'
      R.td null,
        R.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.title
          ref: 'title'
      R.td null,
        R.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.record.amount
          ref: 'amount'
      R.td null,
        R.a
          className: 'btn btn-default col-xs-6'
          onClick: @handleEdit
          'Update'
        R.a
          className: 'btn btn-danger col-xs-6'
          onClick: @handleDelete
          'Delete'

  render: ->
    R = React.DOM
    if @state.edit
      @recordForm()
    else
      @recordRow()
