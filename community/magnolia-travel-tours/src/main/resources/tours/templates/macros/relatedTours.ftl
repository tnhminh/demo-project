[#-- Displays a row of featured tours. --]
[#macro relatedTours categoryName tours]

    [#include "/tours/templates/macros/image.ftl" /]
    [#include "/tours/templates/macros/editorAlert.ftl" /]

    [#if tours?has_content || cmsfn.editMode]
    <div class="container after-category-header">

    [#-- get(key, args[]) requires the second parameter to be a sequence --]
        <h2>${i18n.get('tour.featured', [categoryName])}</h2>
        <div class="row">
            [#list tours as tour]
                [#assign name = tour.name!tour.@name /]
                [#assign description = tour.description!"" /]
                [#assign tourLink = tourfn.getTourLink(tour)!"#" /]

                <div class="col-md-4 product-card">
                    <div class="product-card-wrapper">
                        <span class="card-teaser-image clearfix">
                            [#assign assetRendition = damfn.getRendition(tour.image, "large-16x9") /]
                            [@tourImage assetRendition "" name /]
                        </span>
                        <h3>${name!}</h3>
                        <div class="product-card-content">
                            [#if description?has_content]
                                <p><span class="description">${description!}</span></p>
                            [/#if]
                        </div>
                        <p class="card-button clearfix">
                            <a class="btn btn-primary" href="${tourLink}">${i18n['tour.view']}</a>
                        </p>
                    </div>
                </div>
            [/#list]
        </div>

        [@editorAlert i18n.get('note.for.editors.featured', [categoryName!""]) /]

    </div>
    [/#if]

[/#macro]