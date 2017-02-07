/**
 * @author    Supercool Ltd <josh@supercooldesign.co.uk>
 * @copyright Copyright (c) 2015, Supercool Ltd
 * @see       http://supercooldesign.co.uk
 */

(function($){


if (typeof PimpMyMatrix == 'undefined')
{
  PimpMyMatrix = {};
}


/**
 * Adds itself to the settings menu of and Matrix field in a fld
 * and provides a fld interface for the configuration of the block
 * type groups and a further fld for each block type’s fields.
 */
PimpMyMatrix.Configurator = Garnish.Base.extend(
{

  $container: null,
  fields: [],

  $form: null,
  $body: null,
  $bigSpinner: null,
  $spinner: null,

  modal: null,

  init: function(container, settings)
  {

    this.$container = $(container);
    this.setSettings(settings, PimpMyMatrix.Configurator.defaults);

    if (this.settings.context === 'global')
    {
      this.addListener(this.$container.find('.edit'), 'click', 'onFieldConfiguratorClick');
      this.addListener(this.$container.find('.delete'), 'click', 'onRemoveConfiguration');
    }
    else
    {
      setTimeout($.proxy(this.modifySettingsButtons,this),0);
      this.$container.on('mousedown', this.settings.fieldSelector, $.proxy(this.onFieldMouseDown, this));
    }

  },

  onRemoveConfiguration: function(ev)
  {
    var $btn = $(ev.target),
        fieldId = $btn.data('pimpmymatrix-field-id'),
        data = {
          context : 'global',
          fieldId : fieldId
        };

    Craft.postActionRequest('pimpMyMatrix/blockTypes/deleteBlockTypes', data, $.proxy(function(response, textStatus)
    {
      if (textStatus == 'success' && response.success)
      {
        Craft.cp.displayNotice(Craft.t('Block type groups deleted.'));
        $btn.addClass('hidden');
      }
      else
      {
        if (textStatus == 'success')
        {
          Craft.cp.displayError(Craft.t('There was an unknown error.'));
        }
      }
    }, this));
  },

  onFieldMouseDown: function(ev)
  {
    ev.preventDefault();
    ev.stopPropagation();
    this.modifySettingsButtons();
  },

  modifySettingsButtons: function()
  {

    var _this = this;

    // Work out which fields are Matrix fields
    this.fields = [];
    this.$container.find(_this.settings.fieldSelector).each(function()
    {
      var id = $(this).data('id').toString();
      if ($.inArray(id, _this.settings.matrixFieldIds) !== -1)
      {
        _this.fields.push($(this));
      }
    });

    // Loop over the settings buttons
    $.each(this.fields, function()
    {

      var $field = $(this);

      if (!$field.data('pimpmymatrix-configurator-initialized'))
      {

        var menuBtn = $field.find('a.settings').data('menubtn') || false;

        if (!menuBtn)
        {
          return;
        }

        var $menu = menuBtn.menu.$container

        $menu.find('ul')
             .children(':first')
             .clone(true)
             .prependTo($menu.find('ul:first'))
             .find('a:first')
               .text(Craft.t('Group block types'))
               .data('pimpmymatrix-field-id', $field.data('id'))
               .attr('data-action', 'pimp')
               .on('click', $.proxy(_this.onFieldConfiguratorClick, _this));

        $field.data('pimpmymatrix-configurator-initialized', true);

      }

    });

  },

  onFieldConfiguratorClick: function(ev)
  {

    ev.preventDefault();
    ev.stopPropagation();

    var $elem = $(ev.target);

    // Start the markup
    this.$form = $('<form class="modal elementselectormodal pimpmymatrix-configurator"/>');

    // Get field id and store it on the modal form element
    var fieldId = $elem.data('pimpmymatrix-field-id');
    this.$form.data('pimpmymatrix-field-id', fieldId);

    // Make the rest of the modal markup
    this.$body = $('<div class="body"/>').appendTo(this.$form);
    this.$body = $('<div class="content"/>').appendTo(this.$body);
    this.$bigSpinner = $('<div class="spinner big"/>').appendTo(this.$body);
    this.$body = $('<div class="main"/>').appendTo(this.$body);
    var $footer = $('<div class="footer"/>').appendTo(this.$form);
    var $buttons = $('<div class="buttons right"/>').appendTo($footer);
    this.$spinner = $('<div class="spinner hidden"/>').appendTo($buttons);
    var $cancelBtn = $('<div class="btn">'+Craft.t('Cancel')+'</div>').appendTo($buttons);
    var $submitBtn = $('<input type="submit" class="btn submit" value="'+Craft.t('Save')+'"/>').appendTo($buttons);

    // Make the Garnish Modal object
    this.modal = new Garnish.Modal(this.$form,
    {
      resizable: true,
      closeOtherModals: true,
      onFadeIn: $.proxy(function()
      {
        this._populateModal();
      }, this),
      onHide: $.proxy(function()
      {
        this.modal.$container.remove();
        this.modal.$shade.remove();
        delete this;
      }, this)
    });

    // Submit and cancel handlers
    this.addListener(this.$form, 'submit', '_handleSubmit');

    this.addListener($submitBtn, 'click', $.proxy(function(ev)
    {
      ev.preventDefault();
      this.$form.one('blockTypesSaved', $.proxy(function()
      {
        this.modal.hide();

        if (this.settings.context === 'global')
        {
          $elem.parent('td').parent('tr').find('.delete').removeClass('hidden');
        }

      }, this));
      this.$form.trigger('submit');
    }, this));

    this.addListener($cancelBtn, 'click', $.proxy(function()
    {
      this.modal.hide();
    }, this));

  },

  _handleSubmit: function(ev)
  {
    ev.preventDefault();

    // Show spinner
    this.$spinner.removeClass('hidden');

    // Get the form data
    var data = this.$form.serialize();

    // Add the context
    data += '&context=' + this.settings.context

    // Post it
    Craft.postActionRequest('pimpMyMatrix/blockTypes/saveBlockTypes', data, $.proxy(function(response, textStatus)
    {
      this.$spinner.addClass('hidden');
      if (textStatus == 'success' && response.success)
      {
        Craft.cp.displayNotice(Craft.t('Block type groups saved.'));
        this._populateModal();
        this.$form.trigger('blockTypesSaved');
      }
      else
      {
        if (textStatus == 'success')
        {
          Craft.cp.displayError(Craft.t('There was an unknown error saving some block type groups.'));
        }
      }
    }, this));
  },

  _populateModal: function()
  {
    // Load a fld with all the blocks in the un-used section, this will
    // allow grouping them in 'tabs' to give us the block groups like normal
    var data = {
      fieldId : this.$form.data('pimpmymatrix-field-id'),
      context : this.settings.context
    };
    Craft.postActionRequest('pimpMyMatrix/getConfigurator', data, $.proxy(function(response, textStatus)
    {
      if (textStatus == 'success')
      {
        this.$body.html(response.html);
        this.$bigSpinner.addClass('hidden');
        var fld = new PimpMyMatrix.GroupsDesigner('#pimpmymatrix-configurator', {
          fieldInputName: 'pimpedBlockTypes[__TAB_NAME__][]',
          context : this.settings.context
        });
      }
    }, this));
  }

},
{
  defaults: {
    matrixFieldIds: null,
    context: false,
    fieldSelector: '.fld-tabcontent > .fld-field'
  }
});


})(jQuery);
