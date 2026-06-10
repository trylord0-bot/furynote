from pathlib import Path


def test_mariadb_schema_asset_contains_required_tables() -> None:
    schema = Path("db/schema.sql").read_text(encoding="utf-8")

    for table_name in (
        "device_tokens",
        "posts",
        "post_likes",
        "comments",
        "pro_purchases",
    ):
        assert f"CREATE TABLE {table_name}" in schema


def test_mariadb_schema_uses_utf8mb4_and_soft_delete_columns() -> None:
    schema = Path("db/schema.sql").read_text(encoding="utf-8")

    assert "DEFAULT CHARSET=utf8mb4" in schema
    assert "posts" in schema
    assert "deleted_at" in schema
