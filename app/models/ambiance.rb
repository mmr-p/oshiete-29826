class Ambiance < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'オシャレ' },
    { id: 3, name: '落ち着いた空間' },
    { id: 4, name: '賑やか（宴会向き）' },
    { id: 5, name: '賑やか（子供連れ向き）' },
  ]
end
