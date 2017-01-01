{CompositeDisposable, Disposable} = require 'atom'
subscriptions = null

hideIcons = (hide) ->
  hideClass = "seti-ui-no-icons"
  atom.views.getView(atom.workspace)?.classList.toggle hideClass, hide


module.exports =
  activate: ->
    subscriptions = new CompositeDisposable()
    subscriptions.add atom.config.observe 'seti-classic.fileIcons', (enabled) =>
      hideIcons not enabled
    subscriptions.add new Disposable => hideIcons(false)
    undefined

  deactivate: =>
    subscriptions?.dispose()
