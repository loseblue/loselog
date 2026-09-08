/*
 * Copyright (C) 2016 -- 2019 Anton Filimonov and other contributors
 *
 * This file is part of loselog.
 *
 * loselog is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * loselog is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with loselog.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef LOSELOG_PATHLINE_H
#define LOSELOG_PATHLINE_H

#include "infoline.h"

class PathLine : public InfoLine
{
  Q_OBJECT

public:
    void setPath(const QString& path);

  protected:
    void contextMenuEvent(QContextMenuEvent *event) override;

  private:
    QString path_;
};


#endif // LOSELOG_PATHLINE_H
