import 'package:mymovies/core/utils/database_helper.dart';
import 'package:mymovies/features/favorite/data/datasources/movie_local_data_source.dart';
import 'package:mymovies/features/movie/data/models/movie_model.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final DatabaseHelper databaseHelper;

  FavoriteLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<void> saveFavorite(Movie movie) async {
    final db = await databaseHelper.database;
    
    final movieModel = MovieModel.fromEntity(movie);

    await db.insert(
      'favorites',
      movieModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeFavorite(int id) async {
    final db = await databaseHelper.database;
    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Movie>> getFavorites() async {
    final db = await databaseHelper.database;
    final result = await db.query('favorites');
    
    return result.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<bool> isFavorite(int id) async {
    final db = await databaseHelper.database;
    final result = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}