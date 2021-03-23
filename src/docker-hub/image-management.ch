%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Advanced Image Management dashboard
keywords: dashboard, images, image management, inactive
title: Advanced Image Management dashboard
---
@y
---
description: Advanced Image Management dashboard
keywords: dashboard, images, image management, inactive
title: Advanced Image Management dashboard
---
@z

@x
> Docker Pro and Team users can now use Docker Hub's new **Advanced Image Management** dashboard. The dashboard enables a new level of access to your content, allowing fine-grained pruning of old data and exploration of old versions of pushed images. [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing subscription to start using the Advanced Image Management dashboard.
@y
> Docker Pro and Team users can now use Docker Hub's new **Advanced Image Management** dashboard. The dashboard enables a new level of access to your content, allowing fine-grained pruning of old data and exploration of old versions of pushed images. [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing subscription to start using the Advanced Image Management dashboard.
@z

@x
The **Advanced Image Management** dashboard allows you to manage Docker images across all repositories. [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing account to a Pro or a Team account to start using the Advanced Image Management dashboard.
@y
The **Advanced Image Management** dashboard allows you to manage Docker images across all repositories. [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing account to a Pro or a Team account to start using the Advanced Image Management dashboard.
@z

@x
The Advanced Image Management dashboard provides a snapshot of your existing images and allows you to view, sort and filter images by tags, activity status and date, and contains options to clean up your workspace by deleting images that are no longer required.
@y
The Advanced Image Management dashboard provides a snapshot of your existing images and allows you to view, sort and filter images by tags, activity status and date, and contains options to clean up your workspace by deleting images that are no longer required.
@z

@x
The dashboard provides visibility into the status of the images in your repository and allows you to reduce the number of images stored in Docker Hub by reviewing their active status. An image retains its 'active' status if it is pulled or pushed in the last month. If there isn’t any activity on the image in the last month, it is considered 'inactive'.
@y
The dashboard provides visibility into the status of the images in your repository and allows you to reduce the number of images stored in Docker Hub by reviewing their active status. An image retains its 'active' status if it is pulled or pushed in the last month. If there isn’t any activity on the image in the last month, it is considered 'inactive'.
@z

@x
By displaying the activity status and tags, the dashboard makes it easier for you to review the existing images and take actions to delete images that are not needed anymore. This is particularly helpful when your repository contains a lot of images that you have pushed over time, and you are now trying to streamline storage in Docker Hub.
@y
By displaying the activity status and tags, the dashboard makes it easier for you to review the existing images and take actions to delete images that are not needed anymore. This is particularly helpful when your repository contains a lot of images that you have pushed over time, and you are now trying to streamline storage in Docker Hub.
@z

@x
The dashboard also displays the old versions of images you have pushed. When you push an image to Docker Hub, you push a manifest, a list of all the layers of your image, and the layers themselves. When you update an existing tag, only the new layers are pushed, along with the new manifest which references these layers. This new manifest gets the tag you specify when you push the image, such as `myNamespace/mytag:latest`. This does not remove the old manifests or the unique layers referenced by them from Hub. You can still use and reference these using the digest of the manifest if you know the SHA.
@y
The dashboard also displays the old versions of images you have pushed. When you push an image to Docker Hub, you push a manifest, a list of all the layers of your image, and the layers themselves. When you update an existing tag, only the new layers are pushed, along with the new manifest which references these layers. This new manifest gets the tag you specify when you push the image, such as `myNamespace/mytag:latest`. This does not remove the old manifests or the unique layers referenced by them from Hub. You can still use and reference these using the digest of the manifest if you know the SHA.
@z

@x
With the new Advanced Image Management dashboard, all of this is now simpler and accessible for you to browse, use, and clean up.
@y
With the new Advanced Image Management dashboard, all of this is now simpler and accessible for you to browse, use, and clean up.
@z

@x
To access the  Advanced Image Management dashboard:
@y
To access the  Advanced Image Management dashboard:
@z

@x
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Repositories** from the main menu and select a repository from the list. This displays a banner indicating the number of inactive images in the repository.
3. Click **View inactive images**. This displays the Advanced Image Management dashboard. It lists images in your repository and allows you to sort and filter images by activity status and last activity date.
@y
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Repositories** from the main menu and select a repository from the list. This displays a banner indicating the number of inactive images in the repository.
3. Click **View inactive images**. This displays the Advanced Image Management dashboard. It lists images in your repository and allows you to sort and filter images by activity status and last activity date.
@z

@x
    > You must be logged in as a Pro or a Team user to use the Advanced Image Management dashboard. Click [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} to upgrade your existing subscription.
@y
    > You must be logged in as a Pro or a Team user to use the Advanced Image Management dashboard. Click [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} to upgrade your existing subscription.
@z

@x
## View images
@y
## View images
@z

@x
The Advanced Image Management dashboard provides a snapshot of your existing images and allows you to view images by tags, activity status and date, and also allows you to clean up your workspace by deleting images that are no longer required.
@y
The Advanced Image Management dashboard provides a snapshot of your existing images and allows you to view images by tags, activity status and date, and also allows you to clean up your workspace by deleting images that are no longer required.
@z

@x
![Advanced image management dashboard](images/image-management-dashboard.png){:width="700px"}
@y
![Advanced image management dashboard](images/image-management-dashboard.png){:width="700px"}
@z

@x
## Delete images
@y
## Delete images
@z

@x
> You must be logged in as a Pro or a Team user and have admin access to the repository to delete images.
@y
> You must be logged in as a Pro or a Team user and have admin access to the repository to delete images.
@z

@x
By default, the Advanced Image Management dashboard displays inactive images in the repository. To delete an inactive image:
@y
By default, the Advanced Image Management dashboard displays inactive images in the repository. To delete an inactive image:
@z

@x
1. Log in to [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Repositories** from the main menu and select a repository from the list. This displays a banner indicating the number of inactive images in the repository.
3. Click **View inactive images**. This displays the Advanced Image Management dashboard.
4. Select the images that you’d like to delete from the repository.
5. Click the delete icon located above the list of images.
@y
1. Log in to [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Repositories** from the main menu and select a repository from the list. This displays a banner indicating the number of inactive images in the repository.
3. Click **View inactive images**. This displays the Advanced Image Management dashboard.
4. Select the images that you’d like to delete from the repository.
5. Click the delete icon located above the list of images.
@z

@x
    ![Advanced image management dashboard](images/dashboard-delete-image.png){:width="700px"}
@y
    ![Advanced image management dashboard](images/dashboard-delete-image.png){:width="700px"}
@z

@x
6. Carefully read the advice displayed about deleting the image you have selected.
7. Select the check box to confirm your action and then click **Delete**.
@y
6. Carefully read the advice displayed about deleting the image you have selected.
7. Select the check box to confirm your action and then click **Delete**.
@z

@x
### Deleting a tagged image
@y
### Deleting a tagged image
@z

@x
A Docker image can contain multiple tags. A ‘tag’ refers to a combination of artifacts or labels associated with the image. When you attempt to delete a tagged image, it deletes the tag associated with the image. This means, if there are any untagged images in your repository that previously held the same tag, those images will also be deleted even if they are not inactive. Therefore, you must be careful when deleting tagged images.
@y
A Docker image can contain multiple tags. A ‘tag’ refers to a combination of artifacts or labels associated with the image. When you attempt to delete a tagged image, it deletes the tag associated with the image. This means, if there are any untagged images in your repository that previously held the same tag, those images will also be deleted even if they are not inactive. Therefore, you must be careful when deleting tagged images.
@z

@x
For example, let's assume that Image-A is tagged as ‘latest’. You push another image, Image-B, and tag it as the new 'latest'. If you now delete Image-B, the 'latest' tag will be deleted, along with all images it previously referred to. However, if those images are tagged by another tag - in this case, if Image-B is also tagged with '1.5.0', for example, that tag would prevent its deletion.
@y
For example, let's assume that Image-A is tagged as ‘latest’. You push another image, Image-B, and tag it as the new 'latest'. If you now delete Image-B, the 'latest' tag will be deleted, along with all images it previously referred to. However, if those images are tagged by another tag - in this case, if Image-B is also tagged with '1.5.0', for example, that tag would prevent its deletion.
@z

@x
## Advanced Image Management API
@y
## Advanced Image Management API
@z

@x
The Advanced Image Management API endpoints allow you to manage Docker images across all repositories. For more information, see [Advanced Image management API](../api/latest/).
@y
The Advanced Image Management API endpoints allow you to manage Docker images across all repositories. For more information, see [Advanced Image management API](../api/latest/).
@z

@x
## Feedback
@y
## Feedback
@z

@x
Thank you for trying out the Advanced Image Management dashboard. Your feedback is very important to us. Let us know your feedback by creating an issue in the [hub-feedback](https://github.com/docker/hub-feedback/issues){: target="_blank" rel="noopener" class="_"} GitHub repository.
@y
Thank you for trying out the Advanced Image Management dashboard. Your feedback is very important to us. Let us know your feedback by creating an issue in the [hub-feedback](https://github.com/docker/hub-feedback/issues){: target="_blank" rel="noopener" class="_"} GitHub repository.
@z
