class PonenteController < ApplicationController

    def index
        @ponentes = Ponente.all
    end

    def mostrar
        @ponente = Ponente.find (params[:id])
    end

end
