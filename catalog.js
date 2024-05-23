
// Открытие модального окна
document.querySelector('#demoModalStart_1').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_1').style.display = 'flex';
});

document.querySelector('#demoModalStart_2').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_2').style.display = 'flex';
});

document.querySelector('#demoModalStart_3').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_3').style.display = 'flex';
});

document.querySelector('#demoModalStart_4').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_4').style.display = 'flex';
});

document.querySelector('#demoModalStart_5').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_5').style.display = 'flex';
});

document.querySelector('#demoModalStart_6').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_6').style.display = 'flex';
});

// Закрытие модального окна
document.querySelector('#demoModalClose_1').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_1').style.display = 'none';
});

document.querySelector('#demoModalClose_2').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_2').style.display = 'none';
});

document.querySelector('#demoModalClose_3').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_3').style.display = 'none';
});

document.querySelector('#demoModalClose_4').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_4').style.display = 'none';
});

document.querySelector('#demoModalClose_5').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_5').style.display = 'none';
});

document.querySelector('#demoModalClose_6').addEventListener('click', function () {
    document.querySelector('#demoModalShadow_6').style.display = 'none';
});



  // Получаем элементы слайдера
const slider = document.querySelector('.slider');
const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');
const slides = Array.from(slider.querySelectorAll('img'));
const slideCount = slides.length;
let slideIndex = 0;

// Устанавливаем обработчики событий для кнопок
prevButton.addEventListener('click', showPreviousSlide);
nextButton.addEventListener('click', showNextSlide);

// Функция для показа предыдущего слайда
function showPreviousSlide() {
  slideIndex = (slideIndex - 1 + slideCount) % slideCount;
  updateSlider();
}

// Функция для показа следующего слайда
function showNextSlide() {
  slideIndex = (slideIndex + 1) % slideCount;
  updateSlider();
}

// Функция для обновления отображения слайдера
function updateSlider() {
  slides.forEach((slide, index) => {
    if (index === slideIndex) {
      slide.style.display = 'block';
    } else {
      slide.style.display = 'none';
    }
  });
}

// Инициализация слайдера
updateSlider();