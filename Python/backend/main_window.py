from PySide6.QtQml import QmlElement
from PySide6.QtCore import QObject, Signal, Slot, QAbstractListModel, QModelIndex, Qt

import pandas as pd

from backend.utils import resource_path

QML_IMPORT_NAME = "main_window"
QML_IMPORT_MAJOR_VERSION = 1


class PandasModel(QAbstractListModel):
    def __init__(self, df, parent=None):
        super().__init__(parent)
        self._df = df
        # Create role names: for each column, assign a role starting at Qt.UserRole + 1.
        self._roles = {}
        role = Qt.UserRole + 1
        for col in df.columns:
            self._roles[role] = col.encode("utf-8")
            role += 1

    def rowCount(self, parent=QModelIndex()):
        return len(self._df)

    def data(self, index, role):
        if not index.isValid():
            return None
        row = index.row()
        colName = None
        # Find which column name corresponds to the given role.
        for r, name in self._roles.items():
            if r == role:
                colName = name.decode("utf-8")
                break
        if colName is None:
            return None
        # Return the data for this row and column.
        return self._df.iloc[row][colName]

    def roleNames(self):
        return self._roles


@QmlElement
class MainWindow(QObject):
    loadDataButtonClicked = Signal(pd.DataFrame)

    @Slot()
    def load_data(self):
        df = pd.read_csv(resource_path("data/ssi_template.csv"), low_memory=False)
        print(df.columns)
        model = PandasModel(df)
        self.loadDataButtonClicked.emit(model)


