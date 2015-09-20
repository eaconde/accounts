@RecordForm = React.createClass
  getInitialState: ->
    date: '',
    title: '',
    amount: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  valid: ->
    @state.title && @state.date && @state.amount

  handleSubmit: (e) ->
    f = @
    e.preventDefault()
    $.post '', { record: @state }, (data) ->
      f.props.handleNewRecord data
      f.setState f.getInitialState()
    , 'JSON'

  render: ->
    R = React.DOM
    R.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      R.div
        className: 'form-group'
        R.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      R.div
        className: 'form-group'
        R.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      R.div
        className: 'form-group'
        R.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Amount'
          name: 'amount'
          value: @state.amount
          onChange: @handleChange
      R.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create Record'
