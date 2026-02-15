
import SwiftUI

struct Login: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    private let maxLength: Int = 20

    var body: some View {
        NavigationView{
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.horizontal, 6)

                
                VStack(spacing: LDSpacing.s12) { // 로그인 부분
                    TextInput(
                        exText: "id",
                        text: $viewModel.id,
                        maxText: maxLength,
                        height:1
                    )
                    .font(.system(size: LDTypography.title3.size))
                    .foregroundStyle(LDColor.Text.secondary)
                
                    
                    TextInput(
                        exText: "password",
                        text: $viewModel.pw,
                        maxText: maxLength,
                        height: 1
                    )
                    .font(.system(size: LDTypography.title3.size))
                    .foregroundStyle(LDColor.Text.secondary)

                    Button {
                        viewModel.login()
                    } label: {
                        Text(viewModel.isLoading ? "로그인 중..." : "로그인")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(
                                    (viewModel.isLoading || viewModel.id.isEmpty || viewModel.pw.isEmpty)
                                    ? LDColor.Text.disabled
                                    : LDColor.Brand.primary
                                )
                                .foregroundColor(.white)
                                .cornerRadius(LDRadius.button)
                    }
                    .disabled(viewModel.isLoading || viewModel.id.isEmpty || viewModel.pw.isEmpty)

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.top, 0)
                .padding(.horizontal, 70)
                
                NavigationLink(destination: SignUp()) {
                    Text("회원가입 하러가기")
                        .underline()
                        .foregroundStyle(LDColor.Text.disabled)
                        .font(.system(size: LDTypography.title3.size))
                }

                
                
            }
            .padding(.horizontal, 20)
        }
        
    }
}


#Preview {
    Login()
}
