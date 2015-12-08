module UsersHelper
  def user_has_posts_or_comments?
    user_posts = Post.where(user: current_user)
    user_comments = Comment.where(user: current_user)
    user_posts.blank? && user_comments.blank?
  end
end
