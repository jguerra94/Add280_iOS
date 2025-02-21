//
//  ContentView.swift
//  imageclassificationapp.jerryg
//
//  Created by add107student on 2/18/25.
//

struct ContentView: View {

      @StateObject private var viewModel = ContentViewModel()

    var body: some View {

        VStack {

            //Prediction Type

            HStack{

                Text("Prediction: ")

                Text(viewModel.prediction)

                //Bottom Of Hstack

            }

            

            //Confidence Level

            HStack{

                Text("Confidence: ")

                Text(viewModel.confidence)

                //Bottom Of Hstack

            }

            

            //Camera Preview that the app uses to display previews

            CameraPreview(session: viewModel.session)

                .onAppear{

                    //ENSURE CODE IS RUN IN BACKGROUND

                    DispatchQueue.global().async {

                        self.viewModel.setupSession()

                    }

                }

           

        }

        .background(

            Image(.bluBD)

                .resizable()

                .scaledToFit()

                .ignoresSafeArea()

        )

    }

}
    
    #Preview {
        ContentView()
    }
}
