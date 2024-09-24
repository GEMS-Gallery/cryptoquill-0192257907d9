import Func "mo:base/Func";
import Text "mo:base/Text";

import Array "mo:base/Array";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Order "mo:base/Order";

actor {
  // Define the structure for a blog post
  type BlogPost = {
    title: Text;
    body: Text;
    author: Text;
    timestamp: Int;
  };

  // Store blog posts
  stable var blogPosts : [BlogPost] = [];

  // Function to add a new blog post
  public func addPost(title: Text, body: Text, author: Text) : async () {
    let newPost : BlogPost = {
      title = title;
      body = body;
      author = author;
      timestamp = Time.now();
    };
    blogPosts := Array.append(blogPosts, [newPost]);
  };

  // Function to get all blog posts, sorted by most recent
  public query func getPosts() : async [BlogPost] {
    Array.sort(blogPosts, func(a: BlogPost, b: BlogPost) : Order.Order {
      Int.compare(b.timestamp, a.timestamp)
    })
  };
}
