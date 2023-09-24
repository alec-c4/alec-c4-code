module Mutations::Users
  class SignUp < Mutations::BaseMutation
    graphql_name "signUp"

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(args)
      user = User.new(args)

      if user.save
        confirmation_token = user.generate_confirmation_token
        UserMailer.confirmation(user, confirmation_token).deliver_now

        {user: user, success: true}
      else
        {errors: user.errors, success: false}
      end
    end
  end
end
