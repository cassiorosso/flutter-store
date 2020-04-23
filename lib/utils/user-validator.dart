class UserValidator{

String validateName(String value){
  if(value.isEmpty || value == null) return "O Campo 'Nome' não pode ser vazio!";
  return null;
}

String validateEmail(String value){
  if(!value.contains('@')) return "Preencha um email válido";
  return null;
}

String validatePassword(String value){
  if(value.length < 6) return "A senha precisa ter no mínimo 5 digitos";
  return null;
}
}