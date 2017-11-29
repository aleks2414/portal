require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { brides: @event.brides, categoria: @event.categoria, content: @event.content, detalles: @event.detalles, fecha: @event.fecha, gabriella: @event.gabriella, is_brides: @event.is_brides, is_detalles: @event.is_detalles, is_gabriella: @event.is_gabriella, is_joymas: @event.is_joymas, is_latingraf: @event.is_latingraf, is_latino: @event.is_latino, is_nissi: @event.is_nissi, is_pasteles: @event.is_pasteles, is_pelo: @event.is_pelo, is_pixen: @event.is_pixen, is_tux: @event.is_tux, joymas: @event.joymas, latingraf: @event.latingraf, latino: @event.latino, lugar: @event.lugar, nissi: @event.nissi, nombre: @event.nombre, pasteles: @event.pasteles, pelo: @event.pelo, pixen: @event.pixen, tux: @event.tux, user_id: @event.user_id, video_url: @event.video_url }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { brides: @event.brides, categoria: @event.categoria, content: @event.content, detalles: @event.detalles, fecha: @event.fecha, gabriella: @event.gabriella, is_brides: @event.is_brides, is_detalles: @event.is_detalles, is_gabriella: @event.is_gabriella, is_joymas: @event.is_joymas, is_latingraf: @event.is_latingraf, is_latino: @event.is_latino, is_nissi: @event.is_nissi, is_pasteles: @event.is_pasteles, is_pelo: @event.is_pelo, is_pixen: @event.is_pixen, is_tux: @event.is_tux, joymas: @event.joymas, latingraf: @event.latingraf, latino: @event.latino, lugar: @event.lugar, nissi: @event.nissi, nombre: @event.nombre, pasteles: @event.pasteles, pelo: @event.pelo, pixen: @event.pixen, tux: @event.tux, user_id: @event.user_id, video_url: @event.video_url }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
