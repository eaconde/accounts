@Record = React.createClass
  getInitialState: ->
    edit: false

  handleEdit: (e) ->
    e.preventDefault()
    console.log 'should be editable!!!'
    @setState edit: !@state.edit

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
      R.td null, amountFormat(@props.record.amount)
      R.td null,
        R.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Edit'
        R.a
          className: 'btn btn-danger'
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
          ref: 'date'
      R.td null,
        R.input
          className: 'form-control'
          type: 'text'
          defaultValue: amountFormat(@props.record.amount)
          ref: 'date'
      R.td null,
        R.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        R.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  render: ->
    R = React.DOM
    if @state.edit
      @recordForm()
    else
      @recordRow()
