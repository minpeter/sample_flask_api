from waitress import serve
import app


print("TEST API IS ONLINE!")
serve(app.app, host='0.0.0.0', port=5000)