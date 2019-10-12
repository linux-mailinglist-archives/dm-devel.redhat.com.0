Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A7D5299
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C43ED20F6;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E3EC5D71C;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F0C11803517;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSMP7005949 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 640C15DA8D; Sat, 12 Oct 2019 21:28:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A5965D9CC;
	Sat, 12 Oct 2019 21:28:22 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E8A310CC1E0;
	Sat, 12 Oct 2019 21:28:20 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:26 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:50 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=n2fIp5e4r/+rS4jHZ1JOL7f8UBRZoTPA8BKlbd0JbMbNzHu4xfil4PMrIA/wWHW164I8+Vf5SRHKp9m6cP2C4tdHrgE1qjVYGu1nEuKnP18/tNFG+L9AdpHRA1bCi6C4/+4QG7xZzcqs7wbiRr1g840laZqPruQqKsf0heLTz7lNgJVEbmLSAdDij9BXo1E0NysMZVlm15gXfZ8SqX2kyw+0q+06oxzauRZo/CLjbYx9URvSzJRkvosYXq0tkHFCF79f3dN2f8isejQgh/RRvQSC/EHKKqwJtUp98/uiOpPnVRSbg2pJhFCJqQbhU6lSNKBQkEjqcDnCG/VLiZrF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GtIU09vJuecqOLQmRR8IktuemBsDUH78ymkbsxoEYH0=;
	b=HKaNz5iQ6g+yQfZGGMqbFbMKHHr3xO+imElI24JsY7kBHuFONFvCWDtiURXXLzJt/nZoRZGEuakLizl6HtaEKuiwaEFVjp0L5+CQis2C7luoVfI+8kYFS59s95pF7D76Sxa0grrlLdCRDRBkKmpSZVgSHhyug/CQp+Q9A2G+IpBB6yCNEdXOqtKGDTOImEBvqlwr6WBsr70DNZ+xQhjEPHLdmmCQyz6iECn1JynZE6knmo1mQUXtNlCnsTo2RuujReu2+k/H8EFf2RZmJA805Vh+AQn0e+bJYiZkgi8cvn40NFlNFhcs9JVYHeTa1kwie7YbGWW7vA4RcLuyzjZXqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:45 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:45 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 07/72] libmultipath: lookup_binding(): don't rely on int
	overflow
Thread-Index: AQHVgUPjmlPzR6wJn0GcDt9CCv+bZg==
Date: Sat, 12 Oct 2019 21:27:45 +0000
Message-ID: <20191012212703.12989-8-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: d5a58c90-f107-4ae0-befa-08d74f5b05d9
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331721FE08E4F771BFB78C04FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfRu+0jcD//Bq3FpAN/ABjdP3Uu3zLZ3+LJJmepdSqfnQkJKsBgPd7Z2JR5RSIXLJM2w1IsCkX0Q3/8FEy6MKE7XCG9chEKmm39nbFfBSsRwfgBFnsbcIjCQvXoLLqUoNRQhiN1jlVtYHx49tLZc9wb0Zu8p/dmHCIg08yNoaIIVrG4KRbxfPehjtYZIb1ecv2KtPk0Ro1/4n6Lyrghh96meQsJxYk9El2SVdJiyXvTXdTIMVZSVbwBDQFBJYDZ5iK8wU+AuEwOvhxziWmERo22nSDJzAnBU+/4n2dlc7AY4nOSnVfGGhFOpLJ/ljKSACrkC4sIw4WtA6fYULlRukQswMSw+0LJQTP8eaAvHbfb0i/EPlZeBlA/XDvi5mABgHnuOJsq3ZRF54I4E+Y3mZUn5O6vNvUrLX35jHNql0vw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a58c90-f107-4ae0-befa-08d74f5b05d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:45.6768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nK5galxHiKnrHhkq0xYtyfZhQKrTsJ6ssNmfKojMIygxr8XiaW3MroDuxLMhVMUFqubh1l2YkR9zhOWxQxqkbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Sat, 12 Oct 2019 21:28:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Sat, 12 Oct 2019 21:28:21 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSMP7005949
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 07/72] libmultipath: lookup_binding(): don't rely
 on int overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Sat, 12 Oct 2019 21:29:20 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

lookup_binding() would return a negative result and issue an error
message if variable "id" became negative. But id is only incremented,
starting from 1. Relying on an int overflow is wrong, because the result
is undefined behavior in C. Also, an overflow might as well (actually, more
likely) occur if biggest_id == INT_MAX.

Also, lookup_binding() would return 0 both in an error case and if a
matching wwid was found. While the two cases could be distinguished
by checking if *map_alias was NULL after return, this is highly
non-standard and confusing. Return -1 in error case.

Because of the semantics of lookup_binding(), the test for "id" before calling
allocate_binding() in get_user_friendly_alias() is redundant.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index a96ba5cc..ac342a54 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -104,6 +104,13 @@ scan_devname(const char *alias, const char *prefix)
 	return n;
 }
 
+/*
+ * Returns: 0   if matching entry in WWIDs file found
+ *         -1   if an error occurs
+ *         >0   a free ID that could be used for the WWID at hand
+ * *map_alias is set to a freshly allocated string with the matching alias if
+ * the function returns 0, or to NULL otherwise.
+ */
 static int
 lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
 	       const char *prefix)
@@ -130,8 +137,14 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
 		if (!alias) /* blank line */
 			continue;
 		curr_id = scan_devname(alias, prefix);
-		if (curr_id == id)
-			id++;
+		if (curr_id == id) {
+			if (id < INT_MAX)
+				id++;
+			else {
+				id = -1;
+				break;
+			}
+		}
 		if (curr_id > biggest_id)
 			biggest_id = curr_id;
 		if (curr_id > id && curr_id < smallest_bigger_id)
@@ -147,20 +160,26 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
 			condlog(3, "Found matching wwid [%s] in bindings file."
 				" Setting alias to %s", wwid, alias);
 			*map_alias = strdup(alias);
-			if (*map_alias == NULL)
+			if (*map_alias == NULL) {
 				condlog(0, "Cannot copy alias from bindings "
-					"file : %s", strerror(errno));
+					"file: out of memory");
+				return -1;
+			}
 			return 0;
 		}
 	}
-	condlog(3, "No matching wwid [%s] in bindings file.", map_wwid);
+	if (id >= smallest_bigger_id) {
+		if (biggest_id < INT_MAX)
+			id = biggest_id + 1;
+		else
+			id = -1;
+	}
 	if (id < 0) {
 		condlog(0, "no more available user_friendly_names");
-		return 0;
-	}
-	if (id < smallest_bigger_id)
-		return id;
-	return biggest_id + 1;
+		return -1;
+	} else
+		condlog(3, "No matching wwid [%s] in bindings file.", map_wwid);
+	return id;
 }
 
 static int
@@ -363,7 +382,7 @@ get_user_friendly_alias(const char *wwid, const char *file, const char *prefix,
 		return NULL;
 	}
 
-	if (!alias && can_write && !bindings_read_only && id)
+	if (can_write && !bindings_read_only && !alias)
 		alias = allocate_binding(fd, wwid, id, prefix);
 
 	fclose(f);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
