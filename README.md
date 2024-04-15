# Lab Day 240412

## Syfte
Implementera "Outbox pattern" utan "optimistic locking". Koden är inte komplett men syftet är endast att visa hur det skulle kunna fungera.

## Idé
Låta publiseringen hantera `sequence_number`.

## Bonus
Spara till Outbox-tabellen (OutBoxMessage) med hjälp av after_save callback. Det vanliga CRUD-pattern:et i rails, dvs:
```ruby
if record.save
   redirect_to record_path
else
   render action :new
end
```
ska fungera som vanligt.

## Gem/Engine
Koden under /lib/company/pub_sub (och migreringen CreatePubSubOutboxMessages) är tänkt att brytas ut till ett separat gem/engine.

## Exempel
För att skriva ActiveRecord-modellen Foo till Outbox-tabellen, lägg till följande:
```ruby
class Foo
  include Company::PubSub::Publisher
end
```

samt en serialiserare:
```ruby
class Foo::PubSub::Serializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :updated_at
end
```
För att publicera från Outbox-tabellen, kör periodvis `Company::PubSub.publish`.
