import subprocess
from pathlib import Path

KYUJI = str(Path(__file__).resolve().parents[1] / "kyuji")

def run_cli(input_text: str, args=None):
    args = args or []
    p = subprocess.run(
        [KYUJI, *args],
        input=input_text,
        text=True,
        capture_output=True,
    )
    return p.returncode, p.stdout, p.stderr

def test_basic_conversion():
    code, out, err = run_cli("國立大學\n")
    assert code == 0
    assert out == "国立大学\n"
    assert err == ""

def test_empty_input():
    code, out, err = run_cli("")
    assert code == 0
    assert out == ""
    assert err == ""

def test_newline_only():
    code, out, err = run_cli("\n")
    assert code == 0
    assert out == "\n"
    assert err == ""

def test_no_target_chars_passthrough():
    code, out, err = run_cli("ABC123\n")
    assert code == 0
    assert out == "ABC123\n"
    assert err == ""

def test_multiple_targets():
    code, out, err = run_cli("國國學學\n")
    assert code == 0
    assert out == "国国学学\n"
    assert err == ""

def test_mixed_text_emoji():
    code, out, err = run_cli("a國🙂學b\n")
    assert code == 0
    assert out == "a国🙂学b\n"
    assert err == ""

def test_large_input_stream():
    text = ("國學\n" * 10000)
    code, out, err = run_cli(text)
    assert code == 0
    assert out.startswith("国学\n")
    assert out.count("\n") == 10000
    assert err == ""

