<#macro title>${question.title()}</#macro>

<#macro headtags>
    <link rel="stylesheet" href="/css/styles.css">
    <script src="/js/tags.js"></script>
    <script src="/js/ckeditor/build/ckeditor.js"></script>
    <script type="module" src="/js/question.js"></script>
</#macro>

<#macro content>
    <div class="question-content">
        <div class="question-header">
            <div><h3><strong>${question.title()}</strong></h3></div>
            <span style="margin-right: 20px; color: gray">Вопрос задан: ${question.createdDate()}</span>
            <span style="color:gray;">Просмотров: ${question.views()}</span>
            <div id="manage-question" style="display: flex; justify-content: right"></div>
        </div>
        <div class="question-body">
            <div>${question.content()}</div>
            <div><#list question.tags() as tag><span class="tag-style">${tag.name()}</span></#list></div>
        </div>
        <div style="background-color: white" class="question-author-info">
            <div class="question-header-author-info">
                <img class="article-profile-mini-img" src="${question.author().profileImage()}">
                <span>${question.author().username()}</span>
            </div>
        </div>
    </div>
    <div class="answers">
        <div style="margin-bottom: 15px" id="write-answer"></div>
        <hr>
        <div id="answers">
        </div>
    </div>
</#macro>

<#include "base.ftl">