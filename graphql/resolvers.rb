class Resolver
  attr_accessor :resolvers
  def initialize()
    @resolvers = {
        "Query" => { 
          "getUser" => Proc.new do | _, args, ctx|
            User.find(args.id.to_i)
          end,
          "getUsers" => Proc.new do | _, args, ctx|
            User.all
          end,
        },
        'Mutation' => {
          "createUser" => Proc.new do | _, args, ctx|
            User.create!(
              login: args.input.login,
              email:  args.input.email,
              name: args.input.name)
          end,
          "updateUser" => Proc.new do | _, args, ctx|
            user = User.find(args.id)
            user.login = args.input.login != '' ? user.login : args.input.login
            user.email = args.input.email != '' ? user.email : args.input.email
            user.name =  args.input.name != ''  ? user.name  : args.input.name
            user.save
            user
          end,
          "deleteUser" => Proc.new do | _, args, ctx|
            User.find(args.id).delete
            args.id
          end,
          "createTest" => Proc.new do | _, args, ctx|
          end,
          "updateTest" => Proc.new do | _, args, ctx|
          end,
          "deleteTest" => Proc.new do | _, args, ctx|
          end,
          "createQuestion" => Proc.new do | _, args, ctx|
          end,
          "updateQuestion" => Proc.new do | _, args, ctx|
          end,
          "deleteQuestion" => Proc.new do | _, args, ctx|
          end
        }
      }
    end
  end