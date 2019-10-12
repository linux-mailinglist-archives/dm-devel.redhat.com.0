Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF59D52A0
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEFDB2D1EF1;
	Sat, 12 Oct 2019 21:30:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C5325263;
	Sat, 12 Oct 2019 21:30:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBBDC4A460;
	Sat, 12 Oct 2019 21:30:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSYgr006097 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E23160BF4; Sat, 12 Oct 2019 21:28:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32F9360BF1;
	Sat, 12 Oct 2019 21:28:34 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC00E30B4B02;
	Sat, 12 Oct 2019 21:28:32 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:39 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:54 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SCFAwA00vUqmmYhoWO0RBzUkdAvTJ11psoaLAp/B10E3+8k8k3/ElOPY3sMPb3RVkbnpScnAro+3BEyIGAT2i/widnX2p28afwg3OHhjZ/NTvS52poFzxSncuL9WMqk4InRiVhB5vjGd4LXJg5lLaqoS/bNxxdjX+nPaa0dlgXPF4RGMyJCiwjHhnxxZWdB/vhwv9GUbwKiclyvBy+oXn9Zux26l/oVlO7CwwVO2yhnJjmk90DWr/UnEHZp8POWafcARFoxKo59VHYejY9LYoLswdZOcVU0EivjvdWtPnwzlN01Br5dKzvJ+jfT8WqiG7FuEYEiMiQ9FwwqqLEbcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VBo01cjmkLbAeIMCj2rJCwRTMbdnK+gWJBSeHAxtAQo=;
	b=OpDJEldvru35AX/e9z3hHwZ5h+OaIk6Nqm3WdFXDk8dFZdoGXpoUUYuWeQEEn+zwv5B21UJtEamnSII5xxGp9k2ouJmoymg9KdAzKloTXOzAk75QRdnfgnPGq2oOZ4psVECVimiWKpARjUzll16yAfQkeVsYVsFOfnur9jr6wluQ2tzOPXAGYsHBJlrIwKzY14YcTs2ads4jCZOR3xXjuse9CKPw9gQOWqF8QaQnavFKX4QsrIBDx6klMzJ9L2yKxoH5JvZiGYLFcW7/11UruHCsZpm+vScmpwtfXZqeVSd0/pjGE16yCQUNYi13NoLWopLhTwMK0cfekXCMVfFW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:53 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:53 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 13/72] libmultipath: alias.c: prepare for cancel-safe
	allocation
Thread-Index: AQHVgUPocYwhLMcMeU6z+oLkPaM5Hw==
Date: Sat, 12 Oct 2019 21:27:53 +0000
Message-ID: <20191012212703.12989-14-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 24449e7d-0892-4537-6f81-08d74f5b0a74
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331718092399228B5F5BC4A5FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:348;
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
x-microsoft-antispam-message-info: fpgnkQSR/KtrCADpTi2nJqAfuqogz3AdvR+opW/8kN5B0q3mjUJXIwi6Q0xXrMNxHC6N+kDKztFLHZAOhreK+S1jDbufsFQvLCwNVL9rd5BxQB8H1/M9IrKzsxS/NEG4yvO34aYYoI9iceVZr8YbI7MFzWkXEx+vbvHLosPOfei0PfUzxTW0rDrDPB6BuYboMD2ZWnWJBUxAQv5az9VpSUUt9LoIW9yZX1Rsfcffp8l7ZwJyRzzZ1skdOPzk4KBla4q6O4BB5qIJ4G//jU8C4Ov7/Lcl+ARh+VQ0lnb9yox2EJTpR/e06RhYlMirAEfjIoM08938fqXVX7MturUpL/1z5zd5avo/Atc8iyT1kb3tiPv4SZ+4PCnFaWytz6WwG6cO0gD8M2e+r8RJjjwoXcOTHV4PIwnnYTmqBj6BioA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 24449e7d-0892-4537-6f81-08d74f5b0a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:53.4794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrxUHBwm7EyfJdMmkjI2TnjPUeD/74pIxYyvqPQZWrnSk+Y4St9qI5YufWp9X7VMgwqlItGPZ2FaO4CdyzLv+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Sat, 12 Oct 2019 21:28:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sat, 12 Oct 2019 21:28:33 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSYgr006097
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 13/72] libmultipath: alias.c: prepare for
 cancel-safe allocation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sat, 12 Oct 2019 21:30:02 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

In functions that return newly allocated memory, avoid cancellation
points before returning, and if that's not possible, guard the code
that contains cancellation points with a cleanup function calling
free(), and immediately before returning, call pthread_cleanup_pop(0).

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 15bbc8ed..0fc9e542 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -268,13 +268,12 @@ allocate_binding(int fd, const char *wwid, int id, const char *prefix)
 	c = strchr(buf, ' ');
 	if (c)
 		*c = '\0';
+
+	condlog(3, "Created new binding [%s] for WWID [%s]", buf, wwid);
 	alias = strdup(buf);
 	if (alias == NULL)
-		condlog(0, "cannot copy new alias from bindings file : %s",
-			strerror(errno));
-	else
-		condlog(3, "Created new binding [%s] for WWID [%s]", alias,
-			wwid);
+		condlog(0, "cannot copy new alias from bindings file: out of memory");
+
 	return alias;
 }
 
@@ -342,7 +341,9 @@ use_existing_alias (const char *wwid, const char *file, const char *alias_old,
 	}
 
 out:
+	pthread_cleanup_push(free, alias);
 	fclose(f);
+	pthread_cleanup_pop(0);
 	return alias;
 }
 
@@ -378,18 +379,19 @@ get_user_friendly_alias(const char *wwid, const char *file, const char *prefix,
 		return NULL;
 	}
 
+	pthread_cleanup_push(free, alias);
+
 	if (fflush(f) != 0) {
 		condlog(0, "cannot fflush bindings file stream : %s",
 			strerror(errno));
 		free(alias);
-		fclose(f);
-		return NULL;
-	}
-
-	if (can_write && !bindings_read_only && !alias)
+		alias = NULL;
+	} else if (can_write && !bindings_read_only && !alias)
 		alias = allocate_binding(fd, wwid, id, prefix);
 
 	fclose(f);
+
+	pthread_cleanup_pop(0);
 	return alias;
 }
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
