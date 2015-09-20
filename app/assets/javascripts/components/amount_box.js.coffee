@AmountBox = React.createClass
  render: ->
    R = React.DOM
    R.div
      className: 'col-md-4'
      R.div
        className: "panel panel-#{ @props.type }"
        R.div
          className: 'panel-heading'
          @props.text
        R.div
          className: 'panel-body'
          amountFormat(@props.amount)
