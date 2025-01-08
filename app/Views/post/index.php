<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Posts List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center mb-4">Posts List</h1>
                <a href="/posts/create" class="btn btn-primary mb-3">Add New Post</a>

                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>id</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($posts)): ?>
                            <?php foreach ($posts as $key => $post): ?>
                                <tr>
                                    <td><?= $key + 1 ?></td>
                                    <td><?= $post['title'] ?></td>
                                    <td><?= $post['content'] ?></td>
                                    <td>
                                        <a href="/posts/show/<?= $post['id'] ?>" class="btn btn-info btn-sm">View</a>
                                        <a href="/posts/edit/<?= $post['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="/posts/delete/<?= $post['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this post?')">Delete</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="4" class="text-center">No posts available.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional if not using advanced components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
