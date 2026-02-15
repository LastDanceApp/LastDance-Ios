import SwiftUI

struct SignUp: View {

    @StateObject private var viewModel = SignupViewModel()
    
    private let maxLength: Int = 20

    private var isDisabled: Bool {
        viewModel.id.isEmpty ||
        viewModel.nickname.isEmpty ||
        viewModel.pw1.isEmpty ||
        viewModel.pw2.isEmpty ||
        viewModel.pw1 != viewModel.pw2
    }

    var body: some View {
        VStack(spacing: LDSpacing.s16) {
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.horizontal, 6)
            
            SignUpInput(title: "아이디", placeholder: "id", text: $viewModel.id, maxText: maxLength)
            SignUpInput(title: "닉네임", placeholder: "nickname", text: $viewModel.nickname, maxText: maxLength)
            SignUpInput(title: "비밀번호", placeholder: "password", text: $viewModel.pw1, maxText: maxLength)
            SignUpInput(title: "비밀번호 확인", placeholder: "password 재입력", text: $viewModel.pw2, maxText: maxLength)

            if !viewModel.pw1.isEmpty && !viewModel.pw2.isEmpty && viewModel.pw1 != viewModel.pw2 {
                Text("비밀번호가 일치하지 않습니다.")
                    .foregroundStyle(Color.red)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button {
                viewModel.signUp()
            } label: {
                Text("회원가입")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(isDisabled ? LDColor.Text.disabled : LDColor.Brand.primary)
                    .foregroundStyle(Color.white)
                    .cornerRadius(8)
            }
            .disabled(isDisabled)
        }
        .padding(.horizontal, 60)
        .padding(.top, 24)
    }
}

private struct SignUpInput: View {

    let title: String
    let placeholder: String
    @Binding var text: String
    let maxText: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: LDTypography.title3.size))
                .foregroundStyle(LDColor.Text.secondary)

            TextInput(
                exText: placeholder,
                text: $text,
                maxText: maxText,
                height: 1
            )
            .font(.system(size: LDTypography.title3.size))
            .foregroundStyle(LDColor.Text.secondary)
        }
    }
}

#Preview {
    SignUp()
}
