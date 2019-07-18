# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root controller: :main, action: :index
  resources :plants, only: [:new, :create, :index]
  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update]
end
