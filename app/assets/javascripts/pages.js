calculate = function() {
  var age_a, age_b, answer_1, answer_2, answer_3, year_a, year_b;
  age_a = document.getElementById('age_of_death_a').value;
  year_a = document.getElementById('year_of_death_a').value;
  age_b = document.getElementById('age_of_death_b').value;
  year_b = document.getElementById('year_of_death_b').value;
  answer_1 = document.getElementById('answer_1');
  answer_2 = document.getElementById('answer_2');
  answer_3 = document.getElementById('answer_3');
  $.ajax({
    url: '/pages/person',
    type: 'POST',
    data: {
      'age_a': age_a,
      'year_a': year_a,
      'age_b': age_b,
      'year_b': year_b
    },
    success: function(data) {
      answer_1.innerHTML = data.answer_1;
      answer_2.innerHTML = data.answer_2;
      answer_3.innerHTML = data.answer_3;
    }
  });
};