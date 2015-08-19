{% include "_tpl_common_.tpl" %}
<!-- Detail -->
<div id="detail" class="open dark" 
 layout="column" layout-align="center center">
  <div ng-init="content = content ? content : _('$_CONTENT')"
   sup-angular-wysiwyg ng-model="content"></div>
</div>
