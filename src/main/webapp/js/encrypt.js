function encrypt(keyfield, passwd, index) {
    var enckey = keyfield.val().split("|");
    var encode = enckey[0];
    var modulus = enckey[1];
    var exponent = enckey[2];
    var key = RSAUtils.getKeyPair(exponent, '', modulus);
    var result = RSAUtils.encryptedString(key, encode + passwd.val());
    var idx = "";
    if (index)idx = index;
    if ($("#encpaswd" + idx).val() == null) {
        var iname = passwd.attr("name");
        passwd.attr("name", "");
        passwd.val("");
        var input = '<input type="hidden"  name="' + iname + '" id="encpaswd' + idx + '" value="' + result + '"/>';
        passwd.parent().append(input);
    } else {
        $("#encpaswd" + idx).val(result);
    }
}
function encPsw(keyfield, passwd) {
    var enckey = keyfield.val().split("|");
    var encode = enckey[0];
    var modulus = enckey[1];
    var exponent = enckey[2];
    var key = RSAUtils.getKeyPair(exponent, '', modulus);
    var result = RSAUtils.encryptedString(key, encode + passwd.val());
    return result;
}