<#macro title>Мой профиль</#macro>
<#macro headtags>
    <script src="/js/validate.js" xmlns="http://www.w3.org/1999/html"></script>
    <link rel="stylesheet" href="/css/styles.css">
    <script src="/js/tags.js"></script>
</#macro>

<#macro content>
    <div class="profile">
        <h2>Профиль пользователя</h2>
        <div class="info-item">
            <span>Имя пользователя:</span>
            <span id="username">${user.username()}</span>
            <button class="edit-btn" data-target="Username">✏️</button>
            <div class="edit-field" id="editUsername">
                <input id ="username-input" type="text" placeholder="Новое имя пользователя">
                <button id="username-button" data-target="Username" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        <div class="info-item">
            <span>Настоящее имя</span>
            <span id="realName"><#if user.realName()??>${user.realName()}<#else>Не указано</#if></span>
            <button class="edit-btn" data-target="RealName">✏️</button>
            <div class="edit-field" id="editRealName">
                <input id="realName-input" type="text" placeholder="Настроящее имя">
                <button id="realName-button" data-target="RealName" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        <div class="info-item">
            <span>Возраст</span>
            <span id="age"><#if user.age()??>${user.age()}<#else>Не указан</#if></span>
            <button class="edit-btn" data-target="Age">✏️</button>
            <div class="edit-field" id="editAge">
                <input id="age-input" type="number" placeholder="Возраст">
                <button id="age-button" data-target="Age" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        <div class="info-item">
            <span>Email:</span>
            <span id="email">${user.email()}</span>
            <button class="edit-btn" data-target="Email">✏️</button>
            <div class="edit-field" id="editEmail">
                <input id="email-input" type="email" placeholder="Новый Email">
                <button id="email-button" data-target="Email" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        <div class="info-item">
            <span>Страна:</span>
            <span id="country"><#if user.country()??>${user.country()}<#else>Не указана</#if></span>
            <button class="edit-btn" data-target="Country">✏️</button>
            <div class="edit-field" id="editCountry">
                <input id="country-input" type="text" placeholder="Страна">
                <button id="country-button" data-target="Country" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        <div class="info-item">
            <span>Город:</span>
            <span id="city"><#if user.city()??>${user.city()}<#else>Не указан</#if></span>
            <button class="edit-btn" data-target="City">✏️</button>
            <div class="edit-field" id="editCity">
                <input id="city-input" type="text" placeholder="Город">
                <button id="city-button" data-target="City" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        <div class="info-item">
            <span>Дата регистрации:</span>
            <span>${user.registerDate()}</span>
        </div>
        <div class="info-item">
            <span>Рейтинг:</span>
            <span>${user.rating()}</span>
        </div>
        <div class="info-item">
            <span>Навыки:</span>
            <span id="skills"><#list user.skills() as skill>
                <span class="tag-style">${skill.name()}</span>
            </#list></span>
            <br>
            <button class="edit-btn confirm-btn" data-target="Skills"️ style="margin-top: 5px">Изменить навыки</button>
            <div class="edit-field" id="editSkills">
                <input class="form-control me-2" type="search" placeholder="Поиск тегов" id="tag-search" style="width: 200px; margin-bottom: 5px;">
                <div id="selected-tags" style="margin-top: 10px; margin-bottom: 10px;">
                    <#list user.skills() as skill>
                        <span class="tag-style new-tag">${skill.name()}</span>
                    </#list>
                </div>
                <div class="mb-3">
                    <select multiple class="form-select" id="tag-list">
                    </select>
                </div>
                <button id="skills-button" data-target="Skills" class="confirm-btn">Подтвердить</button>
            </div>
        </div>

        <div>
            <button class="edit-btn confirm-btn" style="margin-top: 20px" data-target="Password">Изменить пароль</button>
            <div class="edit-field" id="editPassword">
                <input id="password-input" type="password" placeholder="Новый пароль">
                <input id="confirmedPassword-input" type="password" placeholder="Подтвердите пароль">
                <button id="password-button" data-target="Password" class="confirm-btn">Подтвердить</button>
            </div>
        </div>
        </div>
    </div>
    <div class="profile-img">
        <img src="${user.profileImage()}" style="width: 220px">
        <form action="" method="post" enctype="multipart/form-data">
            <label for="file">Аватарка</label>
            <input type="file" name="image" id="file" accept=".png, .jpg, .jpeg" title=" ">
            <br>
            <input type="submit" value="Загрузить">
        </form>
    </div>
    <script src="/js/settings.js"></script>
</#macro>

<#include "base.ftl">