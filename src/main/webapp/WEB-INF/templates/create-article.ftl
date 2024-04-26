<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создать статью</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <script src="/js/tags.js"></script>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <h2 class="mb-4">Создать новую статью</h2>
            <form action="/create/article" method="post">
                <div class="mb-3">
                    <label for="articleTitle" class="form-label">Загаловок</label>
                    <input type="text" class="form-control" id="articleTitle" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="articleContent" class="form-label">Содержание</label>
                    <textarea class="form-control" id="articleContent" name="content" rows="8"></textarea>
                </div>
                <div class="mb-3">
                    <h5 class="form-label">Теги</h5>
                    <input class="form-control me-2" type="search" placeholder="Поиск тегов" id="tag-search" style="width: 200px; margin-bottom: 5px;">
                    <div id="selected-tags" style="margin-top: 10px; margin-bottom: 10px;"></div>
                    <div class="mb-3">
                        <select multiple class="form-select" id="tag-list">
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Publish</button>
            </form>
        </div>
    </div>
</div>
<script src="/js/ckeditor/build/ckeditor.js"></script>
<script src="/js/article-create.js"></script>
</body>
</html>
