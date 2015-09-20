@AmountBox = React.createClass
  render: ->
    R = React.DOM
    R.div
      className: 'col-md-4 box'
      R.div
        className: "panel panel-#{ @props.type }"
        R.div
          className: 'panel-heading text-center'
          @props.text
        R.div
          className: 'panel-body'
          R.p
            className: 'lead text-center'
            amountFormat(@props.amount)
