// Copyright 2025 Mist Tecnologia LTDA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

const std = @import("std");

pub const c = @cImport({
    @cInclude("sqliteInt.h");
});

export fn sqlite3AddCheckConstraint(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
    str1: [*]const u8,
    str2: [*]const u8,
) void {
    _ = parse;
    _ = expr;
    _ = str1;
    _ = str2;
}

export fn sqlite3AddCollateType(
    parse: [*]c.Parse,
    token: [*]c.Token,
) void {
    _ = parse;
    _ = token;
}

export fn sqlite3AddColumn(
    parse: [*]c.Parse,
    token1: c.Token,
    token2: c.Token,
) void {
    _ = parse;
    _ = token1;
    _ = token2;
}

export fn sqlite3AddDefaultValue(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
    str1: [*]const u8,
    str2: [*]const u8,
) void {
    _ = parse;
    _ = expr;
    _ = str1;
    _ = str2;
}

export fn sqlite3AddGenerated(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
    token: [*]c.Token,
) void {
    _ = parse;
    _ = expr;
    _ = token;
}

export fn sqlite3AddNotNull(
    parse: [*]c.Parse,
    val: c_int,
) void {
    _ = parse;
    _ = val;
}

export fn sqlite3AddPrimaryKey(
    parse: [*]c.Parse,
    expr_list: [*]c.ExprList,
    sort_order: c_int,
    auto_inc: c_int,
    conflict_clause: c_int,
) void {
    _ = parse;
    _ = expr_list;
    _ = sort_order;
    _ = auto_inc;
    _ = conflict_clause;
}

export fn sqlite3AddReturning(
    parse: [*]c.Parse,
    expr_list: [*]c.ExprList,
) void {
    _ = parse;
    _ = expr_list;
}

export fn sqlite3AlterBeginAddColumn(
    parse: [*]c.Parse,
) void {
    _ = parse;
}

export fn sqlite3AlterDropColumn(
    parse: [*]c.Parse,
    table: [*]c.SrcList,
    column: [*]c.Token,
) void {
    _ = parse;
    _ = table;
    _ = column;
}

export fn sqlite3AlterFinishAddColumn(
    parse: [*]c.Parse,
    table: [*]c.Token,
) void {
    _ = parse;
    _ = table;
}

export fn sqlite3AlterRenameColumn(
    parse: [*]c.Parse,
    table: [*]c.SrcList,
    column: [*]c.Token,
    new_name: [*]c.Token,
) void {
    _ = parse;
    _ = table;
    _ = column;
    _ = new_name;
}

export fn sqlite3AlterRenameTable(
    parse: [*]c.Parse,
    table: [*]c.SrcList,
    new_name: [*]c.Token,
) void {
    _ = parse;
    _ = table;
    _ = new_name;
}

export fn sqlite3Analyze(
    parse: [*]c.Parse,
    table: [*]c.Token,
) void {
    _ = parse;
    _ = table;
}

export fn sqlite3Attach(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
    name: [*]c.Token,
    key: [*]c.Expr,
) void {
    _ = parse;
    _ = expr;
    _ = name;
    _ = key;
}

export fn sqlite3BeginTransaction(
    parse: [*]c.Parse,
    transaction_type: c_int,
) void {
    _ = parse;
    _ = transaction_type;
}

export fn sqlite3BeginTrigger(
    parse: [*]c.Parse,
    name: [*]c.Token,
    tr_op: c_int,
    tr_time: c_int,
    table: [*]c.SrcList,
    foreach_flag: c_int,
    when: [*]c.Expr,
    step_list: [*]c.TriggerStep,
    all: c_int,
) void {
    _ = parse;
    _ = name;
    _ = tr_op;
    _ = tr_time;
    _ = table;
    _ = foreach_flag;
    _ = when;
    _ = step_list;
    _ = all;
}

export fn sqlite3CreateForeignKey(
    parse: [*]c.Parse,
    from_cols: [*]c.ExprList,
    table: [*]c.Token,
    to_cols: [*]c.ExprList,
    constraint_name: [*]c.Token,
    flags: c_int,
) void {
    _ = parse;
    _ = from_cols;
    _ = table;
    _ = to_cols;
    _ = constraint_name;
    _ = flags;
}

export fn sqlite3CreateIndex(
    parse: [*]c.Parse,
    name: [*]c.Token,
    table: [*]c.Token,
    cols: [*]c.ExprList,
    onconf: c_int,
    sort: c_int,
    ifnotexist: c_int,
    unique: c_int,
) void {
    _ = parse;
    _ = name;
    _ = table;
    _ = cols;
    _ = onconf;
    _ = sort;
    _ = ifnotexist;
    _ = unique;
}

export fn sqlite3CreateView(
    parse: [*]c.Parse,
    name: [*]c.Token,
    columns: [*]c.ExprList,
    select: [*]c.Select,
    with: [*]c.Select,
    flags: c_int,
) void {
    _ = parse;
    _ = name;
    _ = columns;
    _ = select;
    _ = with;
    _ = flags;
}

export fn sqlite3CteNew(
    parse: [*]c.Parse,
    name: [*]c.Token,
    schema: [*]c.Token,
    columns: [*]c.ExprList,
    select: [*]c.Select,
    flags: c_int,
) [*]c.Cte {
    _ = parse;
    _ = name;
    _ = schema;
    _ = columns;
    _ = select;
    _ = flags;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3DbMallocRawNN(
    db: [*]c.sqlite3,
    n: c_int,
) ?*anyopaque {
    _ = db;
    _ = n;
    return null;
}

export fn sqlite3DbMallocZero(
    db: [*]c.sqlite3,
    n: c_int,
) ?*anyopaque {
    _ = db;
    _ = n;
    return null;
}

export fn sqlite3DbNNFreeNN(
    db: [*]c.sqlite3,
    ptr: ?*anyopaque,
) void {
    _ = db;
    _ = ptr;
}

export fn sqlite3DbStrNDup(
    db: [*]c.sqlite3,
    z: [*]const u8,
    n: c_int,
) [*]u8 {
    _ = db;
    _ = z;
    _ = n;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3DeferForeignKey(
    parse: [*]c.Parse,
    onoff: c_int,
) void {
    _ = parse;
    _ = onoff;
}

export fn sqlite3DeleteFrom(
    parse: [*]c.Parse,
    table: [*]c.SrcList,
    where: [*]c.Expr,
    returning: [*]c.Returning,
) void {
    _ = parse;
    _ = table;
    _ = where;
    _ = returning;
}

export fn sqlite3DeleteTable(
    db: [*]c.sqlite3,
    table: [*]c.Table,
) void {
    _ = db;
    _ = table;
}

export fn sqlite3DeleteTrigger(
    db: [*]c.sqlite3,
    trigger: [*]c.Trigger,
) void {
    _ = db;
    _ = trigger;
}

export fn sqlite3DeleteTriggerStep(
    db: [*]c.sqlite3,
    step: [*]c.TriggerStep,
) void {
    _ = db;
    _ = step;
}

export fn sqlite3DequoteExpr(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
) void {
    _ = parse;
    _ = expr;
}

export fn sqlite3DequoteNumber(
    parse: [*]c.Parse,
    token: [*]c.Token,
) void {
    _ = parse;
    _ = token;
}

export fn sqlite3Detach(
    parse: [*]c.Parse,
    name: [*]c.Token,
) void {
    _ = parse;
    _ = name;
}

export fn sqlite3DropIndex(
    parse: [*]c.Parse,
    name: [*]c.SrcList,
    flags: c_int,
) void {
    _ = parse;
    _ = name;
    _ = flags;
}

export fn sqlite3DropTable(
    parse: [*]c.Parse,
    name: [*]c.SrcList,
    flags: c_int,
) void {
    _ = parse;
    _ = name;
    _ = flags;
}

export fn sqlite3DropTrigger(
    parse: [*]c.Parse,
    name: [*]c.SrcList,
    flags: c_int,
) void {
    _ = parse;
    _ = name;
    _ = flags;
}

export fn sqlite3EndTable(
    parse: [*]c.Parse,
    name: [*]c.Token,
    schema: [*]c.Token,
    flags: u32,
    select: [*]c.Select,
) void {
    _ = parse;
    _ = name;
    _ = schema;
    _ = flags;
    _ = select;
}

export fn sqlite3EndTransaction(
    parse: [*]c.Parse,
    transaction_type: c_int,
) void {
    _ = parse;
    _ = transaction_type;
}

export fn sqlite3ErrStr(
    rc: c_int,
) [*:0]const u8 {
    _ = rc;
    return "";
}

export fn sqlite3ErrorMsg(
    parse: [*]c.Parse,
    _: [*:0]const u8,
    ...,
) void {
    const db = parse[0].db;
    std.debug.assert(db != null);
    std.debug.assert(db.*.pParse == parse or db.*.pParse.*.pToplevel == parse);

    db.*.errByteOffset = -2;

    //var ap = @cVaStart();
    //defer @cVaEnd(&ap);
    //const msg = c.sqlite3VMPrintf(db, fmt, @as([*c]c.struct___va_list_tag_1, @ptrCast(&ap)));

    if (db.*.errByteOffset < -1) {
        db.*.errByteOffset = -1;
    }

    if (db.*.suppressErr != 0) {
        //c.sqlite3DbFree(db, msg);
        if (db.*.mallocFailed != 0) {
            parse[0].nErr += 1;
            parse[0].rc = c.SQLITE_NOMEM;
        }
    } else {
        parse[0].nErr += 1;
        //c.sqlite3DbFree(db, parse[0].zErrMsg);
        //parse[0].zErrMsg = msg;
        parse[0].rc = c.SQLITE_ERROR;
        parse[0].pWith = null;
    }
}

export fn sqlite3Expr(
    db: [*]c.sqlite3,
    op: c_int,
    p1: [*]c.Expr,
    p2: [*]c.Expr,
    p3: [*]c.Expr,
) [*]c.Expr {
    _ = db;
    _ = op;
    _ = p1;
    _ = p2;
    _ = p3;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprAddCollateToken(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
    token: [*]c.Token,
    flags: c_int,
) [*]c.Expr {
    _ = parse;
    _ = expr;
    _ = token;
    _ = flags;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprAddFunctionOrderBy(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
    sort: [*]c.ExprList,
) void {
    _ = parse;
    _ = expr;
    _ = sort;
}

export fn sqlite3ExprAlloc(
    db: [*]c.sqlite3,
    op: c_int,
    token: [*]c.Token,
    enc: c_int,
) [*]c.Expr {
    _ = db;
    _ = op;
    _ = token;
    _ = enc;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprAnd(
    db: [*]c.sqlite3,
    left: [*]c.Expr,
    right: [*]c.Expr,
) [*]c.Expr {
    _ = db;
    _ = left;
    _ = right;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprAssignVarNumber(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
) void {
    _ = parse;
    _ = expr;
}

export fn sqlite3ExprAttachSubtrees(
    db: [*]c.sqlite3,
    expr: [*]c.Expr,
    p1: [*]c.Expr,
    p2: [*]c.Expr,
) void {
    _ = db;
    _ = expr;
    _ = p1;
    _ = p2;
}

export fn sqlite3ExprDelete(
    db: [*]c.sqlite3,
    expr: [*]c.Expr,
) void {
    _ = db;
    _ = expr;
}

export fn sqlite3ExprFunction(
    parse: [*]c.Parse,
    args: [*]c.ExprList,
    token: [*]c.Token,
    flags: c_int,
) [*]c.Expr {
    _ = parse;
    _ = args;
    _ = token;
    _ = flags;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprIdToTrueFalse(
    expr: [*]c.Expr,
) c_int {
    _ = expr;
    return 0;
}

export fn sqlite3ExprIsConstant(
    expr: [*]c.Expr,
) c_int {
    _ = expr;
    return 0;
}

export fn sqlite3ExprListAppend(
    db: [*]c.sqlite3,
    list: [*]c.ExprList,
    expr: [*]c.Expr,
) [*]c.ExprList {
    _ = db;
    _ = list;
    _ = expr;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprListAppendVector(
    db: [*]c.sqlite3,
    list: [*]c.ExprList,
    expr: [*]c.Expr,
    sort_order: c_int,
) [*]c.ExprList {
    _ = db;
    _ = list;
    _ = expr;
    _ = sort_order;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3ExprListCheckLength(
    parse: [*]c.Parse,
    list: [*]c.ExprList,
    name: [*]const u8,
) void {
    _ = parse;
    _ = list;
    _ = name;
}

export fn sqlite3ExprListDelete(
    db: [*]c.sqlite3,
    list: [*]c.ExprList,
) void {
    _ = db;
    _ = list;
}

export fn sqlite3ExprListSetName(
    parse: [*]c.Parse,
    list: [*]c.ExprList,
    name: [*]c.Token,
    span: c_int,
) void {
    _ = parse;
    _ = list;
    _ = name;
    _ = span;
}

export fn sqlite3ExprListSetSortOrder(
    list: [*]c.ExprList,
    sort_order: c_int,
) void {
    _ = list;
    _ = sort_order;
}

export fn sqlite3ExprListSetSpan(
    parse: [*]c.Parse,
    list: [*]c.ExprList,
    start: [*c]const u8,
    end: [*c]const u8,
) void {
    _ = parse;
    _ = list;
    _ = start;
    _ = end;
}

export fn sqlite3ExprListToValues(
    parse: [*]c.Parse,
    list: [*]c.ExprList,
) void {
    _ = parse;
    _ = list;
}

export fn sqlite3ExprSetErrorOffset(
    expr: [*]c.Expr,
    offset: c_int,
) void {
    _ = expr;
    _ = offset;
}

export fn sqlite3ExprSetHeightAndFlags(
    expr: [*]c.Expr,
) void {
    _ = expr;
}

export fn sqlite3ExprUnmapAndDelete(
    parse: [*]c.Parse,
    expr: [*]c.Expr,
) void {
    _ = parse;
    _ = expr;
}

export fn sqlite3FaultSim(
    iTest: c_int,
) c_int {
    _ = iTest;
    return 0;
}

export fn sqlite3FinishCoding(
    parse: [*]c.Parse,
) void {
    _ = parse;
}

export fn sqlite3FinishTrigger(
    parse: [*]c.Parse,
    trigger: [*]c.TriggerStep,
    token: [*]c.Token,
) void {
    _ = parse;
    _ = trigger;
    _ = token;
}

export fn sqlite3GetInt32(
    str: [*]const u8,
    val: [*]c_int,
) void {
    _ = str;
    _ = val;
}

export fn sqlite3IdListAppend(
    db: [*]c.sqlite3,
    list: [*]c.IdList,
    token: [*]c.Token,
) [*]c.IdList {
    _ = db;
    _ = list;
    _ = token;
    return undefined; // Return undefined for non-optional pointer type
}

export fn sqlite3IdListDelete(
    db: [*]c.sqlite3,
    list: [*]c.IdList,
) void {
    _ = db;
    _ = list;
}

export fn sqlite3Insert(
    parse: [*]c.Parse,
    src: [*]c.SrcList,
    expr_list: [*]c.ExprList,
    select: [*]c.Select,
    id_list: [*]c.IdList,
    upsert: [*]c.Upsert,
    returning: [*]c.Returning,
) void {
    _ = parse;
    _ = src;
    _ = expr_list;
    _ = select;
    _ = id_list;
    _ = upsert;
    _ = returning;
}

export fn sqlite3JoinType(
    parse: [*]c.Parse,
    src: [*]c.SrcList,
    token: [*]c.Token,
    type_val: c_int,
) void {
    _ = parse;
    _ = src;
    _ = token;
    _ = type_val;
}

export fn sqlite3MPrintf(db: [*]c.sqlite3, fmt: [*:0]const u8, ...) [*:0]u8 {
    _ = db;
    _ = fmt;
    return undefined;
}

export fn sqlite3Malloc(
    n: c_int,
) ?*anyopaque {
    _ = n;
    return null;
}

export fn sqlite3MultiValues(
    parse: [*]c.Parse,
    values: [*]c.ExprList,
) [*]c.ExprList {
    _ = parse;
    _ = values;
    return undefined;
}

export fn sqlite3MultiValuesEnd(
    parse: [*]c.Parse,
    values: [*]c.ExprList,
) [*]c.ExprList {
    _ = parse;
    _ = values;
    return undefined;
}

export fn sqlite3NameFromToken(
    db: [*]c.sqlite3,
    token: [*]c.Token,
) [*:0]u8 {
    _ = db;
    _ = token;
    return undefined;
}

export fn sqlite3OomFault(
    db: [*]c.sqlite3,
) void {
    _ = db;
}

export fn sqlite3PExpr(
    parse: [*]c.Parse,
    op: c_int,
    p1: [*]c.Expr,
    p2: [*]c.Expr,
    p3: [*]c.Token,
) [*]c.Expr {
    _ = parse;
    _ = op;
    _ = p1;
    _ = p2;
    _ = p3;
    return undefined;
}

export fn sqlite3PExprAddSelect(
    parse: [*]c.Parse,
    op: c_int,
    select: [*]c.Select,
) [*]c.Expr {
    _ = parse;
    _ = op;
    _ = select;
    return undefined;
}

export fn sqlite3Pragma(
    parse: [*]c.Parse,
    pragma: [*]c.Token,
    name: [*]c.Token,
    args: [*]c.ExprList,
    flags: c_int,
) void {
    _ = parse;
    _ = pragma;
    _ = name;
    _ = args;
    _ = flags;
}

export fn sqlite3ReadSchema(
    parse: [*]c.Parse,
) c_int {
    _ = parse;
    return 0;
}

export fn sqlite3Reindex(
    parse: [*]c.Parse,
    name: [*]c.Token,
) void {
    _ = parse;
    _ = name;
}

export fn sqlite3RenameTokenMap(
    parse: [*]c.Parse,
    to: ?*const anyopaque,
    token: [*]c.Token,
) ?*const anyopaque {
    _ = parse;
    _ = to;
    _ = token;
    return undefined;
}

export fn sqlite3RenameTokenRemap(
    parse: [*]c.Parse,
    token: [*]c.Token,
) void {
    _ = parse;
    _ = token;
}

export fn sqlite3Savepoint(
    parse: [*]c.Parse,
    op: c_int,
    name: [*]c.Token,
) void {
    _ = parse;
    _ = op;
    _ = name;
}

export fn sqlite3Select(
    parse: [*]c.Parse,
    select: [*]c.Select,
    dest: [*]c.SelectDest,
) void {
    _ = parse;
    _ = select;
    _ = dest;
}

export fn sqlite3SelectDelete(
    db: [*]c.sqlite3,
    select: [*]c.Select,
) void {
    _ = db;
    _ = select;
}

export fn sqlite3SelectNew(
    parse: [*]c.Parse,
    expr_list: [*]c.ExprList,
    src: [*]c.SrcList,
    where: [*]c.Expr,
    group_by: [*]c.ExprList,
    having: [*]c.Expr,
    window: [*]c.ExprList,
    order_by: [*]c.ExprList,
    flags: c_int,
    limit: c_int,
) [*]c.Select {
    _ = parse;
    _ = expr_list;
    _ = src;
    _ = where;
    _ = group_by;
    _ = having;
    _ = window;
    _ = order_by;
    _ = flags;
    _ = limit;
    return undefined;
}

export fn sqlite3SelectOpName(
    op: c_int,
) [*:0]const u8 {
    _ = op;
    return "";
}

export fn sqlite3SrcListAppend(
    db: [*]c.sqlite3,
    list: [*]c.SrcList,
    name: [*]c.Token,
    schema: [*]c.Token,
) [*]c.SrcList {
    _ = db;
    _ = list;
    _ = name;
    _ = schema;
    return undefined;
}

export fn sqlite3SrcListAppendFromTerm(
    parse: [*]c.Parse,
    list: [*]c.SrcList,
    name: [*]c.Token,
    schema: [*]c.Token,
    alias: [*]c.Token,
) [*]c.SrcList {
    _ = parse;
    _ = list;
    _ = name;
    _ = schema;
    _ = alias;
    return undefined;
}

export fn sqlite3SrcListAppendList(
    db: [*]c.sqlite3,
    target: [*]c.SrcList,
    source: [*]c.SrcList,
) [*]c.SrcList {
    _ = db;
    _ = target;
    _ = source;
    return undefined;
}

export fn sqlite3SrcListDelete(
    db: [*]c.sqlite3,
    list: [*]c.SrcList,
) void {
    _ = db;
    _ = list;
}

export fn sqlite3SrcListFuncArgs(
    parse: [*]c.Parse,
    list: [*]c.SrcList,
    expr: [*]c.ExprList,
) void {
    _ = parse;
    _ = list;
    _ = expr;
}

export fn sqlite3SrcListIndexedBy(
    parse: [*]c.Parse,
    list: [*]c.SrcList,
    idx: [*]c.Token,
) void {
    _ = parse;
    _ = list;
    _ = idx;
}

export fn sqlite3SrcListShiftJoinType(
    list: [*]c.SrcList,
) void {
    _ = list;
}

export fn sqlite3StartTable(
    parse: [*]c.Parse,
    name: [*]c.Token,
    schema: [*]c.Token,
    flags: c_int,
    type_val: c_int,
    create_tab: c_int,
    flags2: c_int,
) void {
    _ = parse;
    _ = name;
    _ = schema;
    _ = flags;
    _ = type_val;
    _ = create_tab;
    _ = flags2;
}

export fn sqlite3TriggerDeleteStep(
    parse: [*]c.Parse,
    table: [*]c.Token,
    where: [*]c.Expr,
) [*]c.TriggerStep {
    _ = parse;
    _ = table;
    _ = where;
    return undefined;
}

export fn sqlite3TriggerInsertStep(
    parse: [*]c.Parse,
    target: [*]c.Token,
    id_list: [*]c.IdList,
    expr_list: [*]c.ExprList,
    select: [*]c.Select,
    upsert: [*]c.Upsert,
) [*]c.TriggerStep {
    _ = parse;
    _ = target;
    _ = id_list;
    _ = expr_list;
    _ = select;
    _ = upsert;
    return undefined;
}

export fn sqlite3TriggerSelectStep(
    parse: [*]c.Parse,
    select: [*]c.Select,
) [*]c.TriggerStep {
    _ = parse;
    _ = select;
    return undefined;
}

export fn sqlite3TriggerUpdateStep(
    parse: [*]c.Parse,
    table: [*]c.Token,
    id_list: [*]c.ExprList,
    expr_list: [*]c.ExprList,
    where: [*]c.Expr,
) [*]c.TriggerStep {
    _ = parse;
    _ = table;
    _ = id_list;
    _ = expr_list;
    _ = where;
    return undefined;
}

export fn sqlite3Update(
    parse: [*]c.Parse,
    src: [*]c.SrcList,
    expr_list: [*]c.ExprList,
    where: [*]c.Expr,
    sort_order: c_int,
    limit: [*]c.Expr,
    returning: [*]c.Returning,
) void {
    _ = parse;
    _ = src;
    _ = expr_list;
    _ = where;
    _ = sort_order;
    _ = limit;
    _ = returning;
}

export fn sqlite3UpsertNew(
    parse: [*]c.Parse,
    target: [*]c.Token,
    id_list: [*]c.IdList,
    expr_list: [*]c.ExprList,
    where: [*]c.Expr,
    flags: c_int,
) [*]c.Upsert {
    _ = parse;
    _ = target;
    _ = id_list;
    _ = expr_list;
    _ = where;
    _ = flags;
    return undefined;
}

export fn sqlite3Vacuum(
    parse: [*]c.Parse,
    args: [*]c.ExprList,
) void {
    _ = parse;
    _ = args;
}

export fn sqlite3VtabArgExtend(
    parse: [*]c.Parse,
    args: [*]c.ExprList,
) void {
    _ = parse;
    _ = args;
}

export fn sqlite3VtabArgInit(
    parse: [*]c.Parse,
) void {
    _ = parse;
}

export fn sqlite3VtabBeginParse(
    parse: [*]c.Parse,
    token: [*]c.Token,
    schema: [*]c.Token,
    always: c_int,
) void {
    _ = parse;
    _ = token;
    _ = schema;
    _ = always;
}

export fn sqlite3VtabFinishParse(
    parse: [*]c.Parse,
    token: [*]c.Token,
) void {
    _ = parse;
    _ = token;
}

export fn sqlite3WindowAlloc(
    parse: [*]c.Parse,
    name: [*]c.Token,
    base: [*]c.Token,
) [*]c.Window {
    _ = parse;
    _ = name;
    _ = base;
    return undefined;
}

export fn sqlite3WindowAssemble(
    parse: [*]c.Parse,
    window: [*]c.Window,
    partition: [*]c.ExprList,
    order_by: [*]c.ExprList,
    frame: [*]c.Window,
) void {
    _ = parse;
    _ = window;
    _ = partition;
    _ = order_by;
    _ = frame;
}

export fn sqlite3WindowAttach(
    parse: [*]c.Parse,
    window: [*]c.Window,
    expr: [*]c.Expr,
) void {
    _ = parse;
    _ = window;
    _ = expr;
}

export fn sqlite3WindowChain(
    parse: [*]c.Parse,
    window1: [*]c.Window,
    window2: [*]c.Window,
) [*]c.Window {
    _ = parse;
    _ = window1;
    _ = window2;
    return undefined;
}

export fn sqlite3WindowDelete(
    db: [*]c.sqlite3,
    window: [*]c.Window,
) void {
    _ = db;
    _ = window;
}

export fn sqlite3WindowListDelete(
    db: [*]c.sqlite3,
    list: [*]c.Window,
) void {
    _ = db;
    _ = list;
}

export fn sqlite3WithAdd(
    parse: [*]c.Parse,
    with: [*]c.With,
    cte: [*]c.Cte,
) [*]c.With {
    _ = parse;
    _ = with;
    _ = cte;
    return undefined;
}

export fn sqlite3WithDelete(
    db: [*]c.sqlite3,
    with: [*]c.With,
) void {
    _ = db;
    _ = with;
}

export fn sqlite3WithPush(
    parse: [*]c.Parse,
    with: [*]c.With,
    target: [*]c.Select,
) c_int {
    _ = parse;
    _ = with;
    _ = target;
    return 0;
}

export fn sqlite3_free(
    ptr: ?*anyopaque,
) void {
    _ = ptr;
}

export fn sqlite3_log(err_code: c_int, fmt: [*:0]const u8, ...) void {
    _ = err_code;
    _ = fmt;
}

export fn sqlite3_realloc(
    ptr: ?*anyopaque,
    n: c_int,
) ?*anyopaque {
    _ = ptr;
    _ = n;
    return null;
}

export fn sqlite3_strnicmp(
    str1: [*]const u8,
    str2: [*]const u8,
    n: c_int,
) c_int {
    _ = str1;
    _ = str2;
    _ = n;
    return 0;
}
