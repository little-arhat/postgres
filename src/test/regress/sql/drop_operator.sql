CREATE OPERATOR === (
        PROCEDURE = int8eq,
        LEFTARG = bigint,
        RIGHTARG = bigint
);

SELECT pg_describe_object(refclassid,refobjid,refobjsubid) as ref, deptype
FROM pg_depend
WHERE classid = 'pg_operator'::regclass AND
      objid = '===(bigint,bigint)'::regoperator
ORDER BY 1;

CREATE OPERATOR !== (
        PROCEDURE = int8ne,
        LEFTARG = bigint,
        RIGHTARG = bigint,
        NEGATOR = ===
);

SELECT po.oprname AS op, po2.oprname AS negator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprnegate
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

DROP OPERATOR !== (bigint, bigint);

SELECT po.oprname AS op, po2.oprname AS negator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprnegate
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

SELECT oprname, oprnegate FROM pg_operator WHERE oprname = '==='
    AND oprleft = 'bigint'::regtype AND oprright = 'bigint'::regtype;

DROP OPERATOR ===(bigint,bigint);

CREATE OPERATOR === (
        PROCEDURE = int8eq,
        LEFTARG = bigint,
        RIGHTARG = bigint,
        COMMUTATOR = ===
);

CREATE OPERATOR !== (
        PROCEDURE = int8ne,
        LEFTARG = bigint,
        RIGHTARG = bigint,
        NEGATOR = ===,
        COMMUTATOR = !==
);

SELECT po.oprname AS op, po2.oprname AS negator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprnegate
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

SELECT po.oprname AS op, po2.oprname AS commutator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprcom
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype
    ORDER BY po.oprname;

DROP OPERATOR !==(bigint, bigint);

SELECT po.oprname AS op, po2.oprname AS negator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprnegate
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

SELECT po.oprname AS op, po2.oprname AS commutator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprcom
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

DROP OPERATOR ===(bigint, bigint);

CREATE OPERATOR === (
        PROCEDURE = int8eq,
        LEFTARG = bigint,
        RIGHTARG = bigint
);

CREATE OPERATOR !== (
        PROCEDURE = int8ne,
        LEFTARG = bigint,
        RIGHTARG = bigint,
        NEGATOR = ===,
        COMMUTATOR = ===
);

SELECT po.oprname AS op, po2.oprname AS commutator, po3.oprname as negator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprcom
    JOIN pg_operator AS po3 ON po.oid = po3.oprnegate
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprname = '===' AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

DROP OPERATOR !==(bigint, bigint);

SELECT po.oprname AS op, po2.oprname AS commutator, po3.oprname as negator FROM pg_operator AS po
    JOIN pg_operator AS po2 ON po.oid = po2.oprcom
    JOIN pg_operator AS po3 ON po.oid = po3.oprnegate
WHERE po.oprnamespace = (SELECT oid FROM
        pg_namespace WHERE nspname = 'public')
    AND po.oprname = '===' AND po.oprleft = 'bigint'::regtype AND po.oprright = 'bigint'::regtype;

DROP OPERATOR ===(bigint, bigint);
