"""empty message

Revision ID: b347a07029b3
Revises: 89ca68e599f1
Create Date: 2023-03-07 10:13:43.419667

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'b347a07029b3'
down_revision = '89ca68e599f1'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('t_carsales')
    op.drop_table('t_results')
    op.drop_table('t_stations')
    op.drop_table('t_cars')
    op.drop_table('t_brands')
    op.drop_table('t_users')
    op.drop_table('t_carsinfo')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('t_carsinfo',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('标题', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('超链接', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('内容', mysql.VARCHAR(length=255), nullable=True),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    op.create_table('t_users',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('用户名', mysql.VARCHAR(length=255), nullable=False),
    sa.Column('密码', mysql.VARCHAR(length=255), nullable=False),
    sa.Column('邮箱', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('是否管理员', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    op.create_table('t_brands',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('名称', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('品牌代号', mysql.VARCHAR(length=255), nullable=True),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    op.create_table('t_cars',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('品牌', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('介绍', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('车型', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('品牌代号', mysql.VARCHAR(length=255), nullable=True),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    op.create_table('t_stations',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('类别', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('范围', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('单位', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('数量', mysql.INTEGER(display_width=255), autoincrement=False, nullable=True),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    op.create_table('t_results',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('时间', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('销量', mysql.INTEGER(display_width=255), autoincrement=False, nullable=True),
    sa.Column('品牌代号', mysql.VARCHAR(length=255), server_default=sa.text("''"), nullable=True),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    op.create_table('t_carsales',
    sa.Column('ID', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False),
    sa.Column('时间', mysql.VARCHAR(length=255), nullable=True),
    sa.Column('销量', mysql.INTEGER(display_width=255), autoincrement=False, nullable=True),
    sa.Column('品牌代号', mysql.VARCHAR(length=255), nullable=True),
    sa.PrimaryKeyConstraint('ID'),
    mysql_default_charset='utf8mb4',
    mysql_engine='MyISAM',
    mysql_row_format='DYNAMIC'
    )
    # ### end Alembic commands ###
