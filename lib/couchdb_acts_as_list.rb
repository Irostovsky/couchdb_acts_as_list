require "couchdb_acts_as_list/version"

module CouchdbActsAsList
  def self.included(base)
    base.class_eval do
      property :position, Integer

      design do
        view :by_position
      end
      before_validation :set_position, on: :create
      after_destroy :reorder_lower_items


      def insert_at pos
        pos = [[pos.to_i, Locale.count].min, 1].max
        decrement_positions_on_lower_items self.position
        self.update_attributes position: nil
        increment_positions_on_lower_items pos
        self.update_attributes position: pos
      end

      private
      def set_position
        self.position = Locale.count + 1
      end

      def reorder_lower_items
        decrement_positions_on_lower_items self.position
      end

      def decrement_positions_on_lower_items(pos)
        self.class.by_position(startkey: pos + 1).each{|l| l.update_attributes position: l.position - 1}
      end

      def increment_positions_on_lower_items(pos)
        self.class.by_position(startkey: pos).each{|l| l.update_attributes position: l.position + 1}
      end

    end

  end
end
