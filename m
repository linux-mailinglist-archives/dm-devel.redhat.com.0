Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4DD529C
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA164300BEAC;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7735C241;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 134FE4A460;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSNtq005962 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 051EB6092F; Sat, 12 Oct 2019 21:28:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD3B608A5;
	Sat, 12 Oct 2019 21:28:22 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EADDC0568FA;
	Sat, 12 Oct 2019 21:28:21 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:42 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:43 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=PF/H9dwxgeVdXGjlaaGZ14xx5ukfuaFCqyH2xck4esJCDldBtY9MURjf3OwVQaW1+wtk1pjETndxOjaiwKUm/YDVyEY/yZjwUSMHP1od1W0mGw3WNRNB4zWEvrsrdECAu+JkqzPXSFlkBor1250aplFdyOrCiR+JHNWoyoHoYHhni/9Tj3gAjNG/ieqdRL36QyW3ZMx60t6ioCwuiHCKEcMJVjF/FQhZGL0274xyamQkwHaFmW796VgJHqfBomCvjnD8pfEy0SbTBP8UhYhKzbOvT35D3WkSZdE43H33hJF0FqS3EkYRb/K+IHd2z7JwD7VRWaQzO+QPJCOrHRxtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/9Zh9ic6aQn2y4nbayDmQ+9N/x2Q5tgeCPPyabd5aJw=;
	b=ZYXC+jXLxpn0nAerTAEq+v71Hz+hAJ/RR+olG2avZyu67T1IrZCwSJyLlCyA6gPIyh/htaSZ/nAR0JubUNmuRN2HqvPAlcU4/r+Il/HCXf5GQ8HnNMDDfBFRolIhu29vc0tGp2CTQcV0SO883QUCnbt8HRUsIIrdwytQ7cBFrdvUfgF+1Oi7JVIHJpwyqcTKsEXOggmabT//M0QpmP1PNAe0KvSRtPKfZ+rGXFcElltugkmj1qXLVK49IBpJyGcLpWvMmXZFrGKrkQ4O4dBXzN/3ISVmCTBpLkYMxAdd72at4EN6RS/nC+XzyvM9Q3JxglEdZTOSGugA4UBktGRCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:42 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:42 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 04/72] libmultipath: alias.c: use strlcpy(), and 2 minor
	fixes
Thread-Index: AQHVgUPhUByRHRMx1UCW8GPIzVX0Tw==
Date: Sat, 12 Oct 2019 21:27:41 +0000
Message-ID: <20191012212703.12989-5-martin.wilck@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
In-Reply-To: <20191012212703.12989-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0045.eurprd02.prod.outlook.com
	(2603:10a6:208:d2::22) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b472986-a357-42d5-fae3-08d74f5b03a1
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331733CE1FDF031774C5F5D1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C18cWM0fDbDpqW+ihJkvWnEEkYhJ2wqtXW40YQmVmYgSkNpIlpAG8z+wAoBB1gNkl6ne7QIOGF00S4ahiF2ABY/JGqbtoeXmcxehws7GUbZiwcCXCejgoevQJ063Rq+W/ivZ0d42uV3SSkj28pt7MTSK+OAix81ctDqbXIoZ5WPyTjifDmFT2z7jEu44KjdasrcjDw/yN4JLcptoAtu8EDAomeEgwP2oasUToodbC5iStSzuY25IOvKWH4Jf6+/HsDCIgGJvq9mpZARnixRCwSz4Nv670ZVzgzY9QT9IMuW41409Xfam6eInBHHoEm6aXPdbarIHNPDhNC1y4a2WZQ1AzLZ3MWxTZFqZwbjloN9/brx9f0jods63KV4cHo3haTD6ukSQqr0CTftwq2LnP6VDQyjM/FiTzeMUrQ9ihUU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b472986-a357-42d5-fae3-08d74f5b03a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:41.9409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ApGiWlDHLBNDe5+POVuMVs8WB00eE9Kvci+RD2fWCDomh/aRcqN0Y8Nc7/K5qDjd7hhA9RRCRh4zkUnZcPRVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Sat, 12 Oct 2019 21:28:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Sat, 12 Oct 2019 21:28:22 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSNtq005962
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 04/72] libmultipath: alias.c: use strlcpy(),
	and 2 minor fixes
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sat, 12 Oct 2019 21:29:41 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 5b05ff69..412ab5b4 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -10,6 +10,7 @@
 #include <stdio.h>
 
 #include "debug.h"
+#include "util.h"
 #include "uxsock.h"
 #include "alias.h"
 #include "file.h"
@@ -189,8 +190,7 @@ rlookup_binding(FILE *f, char *buff, const char *map_alias, const char *prefix)
 		if (strcmp(alias, map_alias) == 0){
 			condlog(3, "Found matching alias [%s] in bindings file."
 				"\nSetting wwid to %s", alias, wwid);
-			strncpy(buff, wwid, WWID_SIZE);
-			buff[WWID_SIZE - 1] = '\0';
+			strlcpy(buff, wwid, WWID_SIZE);
 			return 0;
 		}
 	}
@@ -214,7 +214,7 @@ allocate_binding(int fd, const char *wwid, int id, const char *prefix)
 
 	i = format_devname(buf, id, LINE_MAX, prefix);
 	c = buf + i;
-	snprintf(c,LINE_MAX - i, " %s\n", wwid);
+	snprintf(c, LINE_MAX - i, " %s\n", wwid);
 	buf[LINE_MAX - 1] = '\0';
 
 	offset = lseek(fd, 0, SEEK_END);
@@ -265,7 +265,7 @@ use_existing_alias (const char *wwid, const char *file, const char *alias_old,
 		close(fd);
 		return NULL;
 	}
-	/* lookup the binding. if it exsists, the wwid will be in buff
+	/* lookup the binding. if it exists, the wwid will be in buff
 	 * either way, id contains the id for the alias
 	 */
 	rlookup_binding(f, buff, alias_old, prefix);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
