class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '寿司・海鮮' },
    { id: 3, name: 'うどん・そば' },
    { id: 4, name: 'ラーメン' },
    { id: 5, name: '焼肉・ステーキ' },
    { id: 6, name: '和食その他' },
    { id: 7, name: 'アジア・エスニック料理' },
    { id: 8, name: 'イタリアン' },
    { id: 9, name: 'フレンチ' },
    { id: 10, name: '居酒屋・バー' },
    { id: 11, name: 'カフェ・スイーツ' },
    { id: 12, name: 'その他' }
  ]
end
