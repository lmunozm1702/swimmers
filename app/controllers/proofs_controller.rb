class ProofsController < ApplicationController
    def index
        @proofs = Proof.all
    end

    def show
        @proof = Proof.find(params[:id])
    end

    def edit
        @proof = Proof.find params[:id]
    end

    def update
        @proof = Proof.find params[:id]
        respond_to do |format|
            if @proof.update(proof_params)
                format.html { redirect_to proof_path(@proof), 
                                            notice: 'Proof was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    private 
    def proof_params
        params.require(:proof).permit(:abbreviation, :description, :pool_type)
    end
end
