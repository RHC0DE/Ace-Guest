//
//  Ace Guest
//


import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var viewModel: AppointmentViewModel
    @State var accessCode = ""
    @State var writer = NFCReaderManager()
    @StateObject var delegate = NotificationDelegate()
    var body: some View {
        
        VStack {
            
            // MARK: - Topbar components
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Button(action: {
                        self.viewModel.hide.toggle()
                        
                    }, label: {
                        
                        HStack {
                            Image(systemName: self.viewModel.hide ? "eye.fill"  : "eye.slash.fill" )
                                .foregroundColor(Color(Colors.systemRed))
                            
                        }
                        .padding([.trailing], 65)
                        
                    })
                    
                    HStack {
                        Text(Strings.accessPassTitle)
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                    }
                    .padding([.trailing], 84)
                    
                    Button(action: {
                        self.viewModel.showSettings.toggle()
                        
                    }, label: {
                        
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(Colors.systemRed))
                            
                        }
                        .padding([.trailing], 12)
                        
                    })
                    .sheet(isPresented: self.$viewModel.showSettings, content: {
                        SettingView()
                    })
                    
                }
                
            }
            
            // MARK: - Instance of CardView
            AccessCardView()
            
            Spacer()
            
        }
        
    }
    
    // MARK: - AccessCardView
    @ViewBuilder
    func AccessCardView()->some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(gradient: Gradient(colors: [viewModel.colorOne, viewModel.colorTwo]), startPoint: .top, endPoint: .bottomTrailing))
                .frame(maxWidth: .infinity)
                .shadow(color: Color(.black), radius: 15, x: -10, y: 10)
            
            Image(Images.ace_frame)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            Image(Images.hid_logo)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding([.leading, .top])
            
            Text(Strings.amsterdam)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding([.leading, .top])
                .padding(.trailing, 10)
            
            Text(viewModel.hide ? "\(viewModel.guestAppointment?.accessCode ?? "")" : Strings.hiddenAccessCode)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding([.leading, .bottom])
            
        }
        .frame(height: 250)
        .padding(.horizontal)
        
        VStack {
            Button(action: {
                print(viewModel.guestAppointment?.accessCode ?? "")
                writer.scan(accessCode: accessCode)
                
            }) {
                
                Text(Strings.scanner)
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 210, height: 50)
                    .background(Color(Colors.systemRed))
                    .clipShape(Capsule())
                
            }
        }.padding(.top, 50)
        
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .environmentObject(AppointmentViewModel())
    }
}
