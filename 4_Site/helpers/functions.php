<?php
function debug($any): void
{
    echo '<pre>';
    /** @noinspection ForgottenDebugOutputInspection */
    var_dump($any);
    echo '</pre>';
}

/**
 * fonction qui vérifie l'existence d'une donnée dans un input html et qui si $checkValue est a true, sécurise également la donnée
 * si la donnée est invalide, un message d'erreur est ajouté dans la sessions et null est retourné
 * sinon on renvoi simplement la donnée
 * @param string $name
 * @param bool $checkValue
 * @return mixed|string|null
 */
function getValidatedInput(string $name, $checkValue = true): ?string
{
    if (!empty($_POST)) {
        if (empty($_POST[$name])) {
            $_SESSION['errors'][$name] = "le champs $name est requis";
            return null;
        }
        if ($checkValue) {
            $data = trim($_POST[$name]);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }
        return $_POST[$name];
    }else {
        return null;
    }
}

/**
 * @param string $url
 */
function redirect(string $url): void
{
    header('Status: 301 Moved Permanently', false, 301);
    header("Location: $url");
}

// function showError($input, $errors): string
// {
//     if (isset($errors[$input])) {
//         return '<p class="mt-2 text-sm text-red-500">' . $errors[$input] . '</p>';
//     }
//     return '';
// }

// function getCleanErrors()
// {
//     $errors = $_SESSION['errors'] ?? null;
//     unset($_SESSION['errors']);
//     return $errors;
// }


function showSession(bool $bool = true)
{
    if ($bool) {
        echo '<pre>';
        /** @noinspection ForgottenDebugOutputInspection */
        var_dump($_SESSION);
        echo '</pre>';
    }
}


function queries($request): array
{
    $queries = parse_url($request, PHP_URL_QUERY);
    $arr = [];
    parse_str($queries, $arr);
    return $arr;
}

function validateFile(array $file): ?string
{
    if ($file['error'] === 0) {
        return null;
    }
    if ($file['error'] === 1 || $file['error'] === 2) {
        return 'image size is too big';
    }
    if ($file['error'] === 4) {
        return 'image is required';
    }
}

