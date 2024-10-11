class MoviesController < ApplicationController
  
# Acción para listar todas las películas
def index
  @movies = Movie.all # Carga todas las películas de la base de datos en la variable de instancia @movies
end

# Acción para mostrar el formulario de nueva película
def new
  @movie = Movie.new # Inicializa un nuevo objeto Movie vacío
end

# Acción para procesar el formulario de creación de una película
def create
  @movie = Movie.new(movie_params) # Crea una nueva película con los datos enviados desde el formulario

  if @movie.save
    # Si la película se guarda correctamente, redirige al listado de películas
    redirect_to movies_path
  else
    # Si no se guarda, vuelve a renderizar el formulario de nuevo
    render :new
  end
end

# Método privado para filtrar los parámetros permitidos del formulario
private

def movie_params
  params.require(:movie).permit(:name, :synopsis, :director) # Solo permite estos tres atributos
end

end
