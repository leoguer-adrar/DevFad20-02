<?php
function debug($any): void
{
    echo '<pre>';
    /** @noinspection ForgottenDebugOutputInspection */
    var_dump($any);
    echo '</pre>';
}

function showError($input, $errors): string
{
    if (isset($errors[$input])) {
        return '<p class="mt-2 text-sm text-red-500">' . $errors[$input] . '</p>';
    }
    return '';
}

function getCleanErrors()
{
    $errors = $_SESSION['errors'] ?? null;
    unset($_SESSION['errors']);
    return $errors;
}


function showSession(bool $bool = true)
{
    if ($bool) {
        echo '<pre>';
        /** @noinspection ForgottenDebugOutputInspection */
        var_dump($_SESSION);
        echo '</pre>';
    }
}

function setActive(string $match): string
{
    return $_SESSION['path'] === $match ? 'bg-gray-900' : 'hover:bg-gray-900';
}

function queries($request): array
{
    $queries = parse_url($request, PHP_URL_QUERY);
    $arr = [];
    parse_str($queries, $arr);
    return $arr;
}

function validateInput(string $data, $checkValue = true): ?string
{
    if (!empty($data)) {
        if ($checkValue) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }
        return $data;
    }
    return null;
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

function dateDiff($datetime, $full = false): string
{
    $now = new DateTime;
    try {
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;

        $string = [
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'minute',
            's' => 'second',
        ];
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }
        unset($v);

        if (!$full) {
            $string = array_slice($string, 0, 1);
        }
        return $string ? implode(', ', $string) . ' ago' : 'just now';
    } catch (Exception $e) {
        return 'invalid date';
    }
}
function queriesGet(string $query, string $method = 'get'): ?bool
{
    if ($method === 'get' && !empty($_GET) && !empty($_GET[$query])) {
        return empty($_GET[$query]);
    }
    if ($method === 'post' && !empty($_POST) && !empty($_POST[$query])) {
        return empty($_POST[$query]);
    }
    return null;
}

