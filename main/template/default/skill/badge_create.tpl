{% extends "default/layout/main.tpl" %}

{% block body %}
    <script>
        (function () {
            var designer = null;
            $(document).on('ready',function(){
                $('.help-badges').tooltip();
                $('.help-badges-img').tooltip();
            }
            );

            $(document).on('ready', function () {
                $('#btn-open-designer').on('click', function (e) {
                    e.preventDefault();

                    var designerUrl = 'https://www.openbadges.me/designer.html?origin={{ _p.web }}';
                    designerUrl = designerUrl + '&email={{ platformAdminEmail }}';
                    designerUrl = designerUrl + '&close=true';
                    designerUrl = designerUrl + '&hidePublish=true';

                    var windowOptions = 'width=1200,height=680,location=0,menubar=0,status=0,toolbar=0';
                    designer = window.open(designerUrl, '', windowOptions);
                });

                $('#image').on('change', function () {
                    var self = this;

                    if (self.files.length > 0) {
                        var image = self.files[0];

                        if (!image.type.match(/image.*/)) {
                            return;
                        }

                        var fileReader = new FileReader();
                        fileReader.onload = function (e) {
                            $('#badge-preview').attr('src', e.target.result);
                            $('#badge-container').removeClass('hide');
                        };
                        fileReader.readAsDataURL(image);
                    }
                });
            });
        })();
    </script>
    <div class="span12">

        <div class="badges-tabs">
            <ul class="nav nav-tabs">
                <li>
                    <a href="{{ _p.web_main }}admin/skill_badge.php">{{ 'Home' | get_lang }}</a>
                </li>
                <li>
                    <a href="{{ _p.web_main }}admin/skill_badge_list.php">{{ 'Insignias Actuales' | get_lang }}</a>
                </li>
                <li class="active">
                    <a href="#">{{ 'Edit' | get_lang }}</a>
                </li>
            </ul>
        </div>

        <div class="tab-content">
            <div class="tab-pane active">
                <div class="openbadges-introduction">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="block-edit">
                            <div class="block-title">{{ 'SkillInfo' | get_lang }}</div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span9">
                        <form action="{{ _p.web_self_query_vars }}" class="form-horizontal" method="post" enctype="multipart/form-data">
                            <fieldset>

                                <div class="control-group">
                                    <label class="control-label" for="name">{{ 'Name' | get_lang }}</label>
                                    <div class="controls">
                                        <input type="text" name="name" id="name" class="input-xxlarge" value="{{ skill.name }}">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="name">{{ 'Description' | get_lang }}</label>
                                    <div class="controls">
                                        <textarea name="description" id="description" class="input-xxlarge" rows="4">{{ skill.description }}</textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="image">{{ 'Image' | get_lang }}</label>
                                    <div class="controls">
                                        <input data-placement="left" data-toggle="tooltip" title="{{ 'Medidas de la insignia 200 x 200 pixeles en formato PNG' | get_lang }}" type="file" name="image" id="image" class="help-badges-img input-xxlarge" accept="image/*">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="criteria">{{ 'CriteriaToEarnTheBadge' | get_lang }}</label>
                                    <div class="controls">
                                        <textarea name="criteria" id="criteria" class="input-xxlarge" rows="10">{{ skill.criteria }}</textarea>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-actions">
                                <button type="submit" class="btn btn-info btn-large">{{ 'Guardar Insignia'| get_lang }}</button>
                            </div>
                        </form>
                    </div>
                    <div class="span3">
                        <div class="create-badges">
                            <button id="btn-open-designer" class="help-badges btn btn-info btn-large btn-block" data-toggle="tooltip" title="{{ 'DesignANewBadgeComment' | get_lang }}" type="button">{{ 'DesignNewBadge' | get_lang }}</button>
                        </div>
                        <p class="badges-text">Vista previa de la imagen</p>
                        <div class="badges-img {{ skill.icon ? '' : 'hide' }}" id="badge-container">
                            <img id="badge-preview" alt="{{ 'BadgePreview' | get_lang }}" src="{{ skill.icon ? [_p.web_data, skill.icon] | join('') : '' }}">
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}
