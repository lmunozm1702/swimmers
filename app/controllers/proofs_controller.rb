class ProofsController < ApplicationController
    before_action :set_proof, only: %i[destroy]

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
        if @proof.update(proof_params)
            flash[:notice] = "Proof successfully updated" 
            redirect_to proofs_path
        else
            flash[:alert] = "Proof can't be updated"
            redirect_to edit_proof_path(@proof)
        end
    end

    def new 
        @proof = Proof.new
    end

    def create
        @proof = Proof.new(proof_params) 

        if @proof.save
            flash[:notice] = "Proof successfully created"
            redirect_to proofs_path
        else
            message_str = "Proof can't be created: "
            @proof.errors.full_messages.each do |message|
                message_str += message + ". "
            end
            flash[:alert] =  message_str
            redirect_to new_proof_path(@proof)
        end      
    end

    def destroy
        if @proof.destroy
            flash[:notice] = "Proof successfully destroyed"
            redirect_to proofs_path
        else
            message_str = "Proof can't be destroyed: "
            @proof.errors.full_messages.each do |message|
                message_str += message + ". "
            end
            flash[:alert] =  message_str
            redirect_to proofs_path
        end      
    end
    
    private 
    def proof_params
        params.require(:proof).permit(:abbreviation, :description, :id)
    end

    def set_proof
        @proof = Proof.find params[:id]
    end
end
