export const idlFactory = ({ IDL }) => {
  const BlogPost = IDL.Record({
    'title' : IDL.Text,
    'body' : IDL.Text,
    'author' : IDL.Text,
    'timestamp' : IDL.Int,
  });
  return IDL.Service({
    'addPost' : IDL.Func([IDL.Text, IDL.Text, IDL.Text], [], []),
    'getPosts' : IDL.Func([], [IDL.Vec(BlogPost)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
