Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D90A810B26C
	for <lists+dm-devel@lfdr.de>; Wed, 27 Nov 2019 16:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574868552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2jgGeKJQN8860T9FSMQvgXOaFIareCzL4im3SjzLtqI=;
	b=TR7wOWWv+VFtpabNpcdLeCwF3j0zzYgZ+65jzW8hV8NanBDn6YPbRL0RGbX/K+qlGwIJX/
	sIYkqIWwlw0/Yfb1ze3lNX1oRzXmx6P2jsAnc65BwDjmDUuCR//KT5jY9I+WJoRloiAgbA
	qL2IDArE5iodjmgVnmoJpwIhyxDwVHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-a3DnB8PqNm6RnVIqnvCuHg-1; Wed, 27 Nov 2019 10:29:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B715B801E57;
	Wed, 27 Nov 2019 15:29:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B56FC5D6C8;
	Wed, 27 Nov 2019 15:29:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C77D18089D0;
	Wed, 27 Nov 2019 15:28:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARFSpcG005032 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 10:28:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B9271054598; Wed, 27 Nov 2019 15:28:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B9F10A7E48
	for <dm-devel@redhat.com>; Wed, 27 Nov 2019 15:28:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D13EC8A5101
	for <dm-devel@redhat.com>; Wed, 27 Nov 2019 15:28:48 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-416-g3_t-a1hPYCN-5Q06O0-Ag-1;
	Wed, 27 Nov 2019 10:28:45 -0500
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 27 Nov 2019 15:28:02 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 27 Nov 2019 15:05:50 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 27 Nov 2019 15:05:50 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1052.namprd18.prod.outlook.com (10.168.115.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.22; Wed, 27 Nov 2019 15:05:48 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::b08c:34c6:ffb6:641c]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::b08c:34c6:ffb6:641c%12]) with mapi id 15.20.2474.023;
	Wed, 27 Nov 2019 15:05:48 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH v2 1/5] multipathd: move set_no_path_retry() back to
	libmultipath
Thread-Index: AQHVpTQmGuzaa2gVQU24ljlZoGaNxA==
Date: Wed, 27 Nov 2019 15:05:48 +0000
Message-ID: <20191127150604.31417-2-martin.wilck@suse.com>
References: <20191127150604.31417-1-martin.wilck@suse.com>
In-Reply-To: <20191127150604.31417-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0040.eurprd06.prod.outlook.com
	(2603:10a6:208:aa::17) To DM5PR18MB1355.namprd18.prod.outlook.com
	(2603:10b6:3:14a::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 810321d8-9e57-4dca-76e9-08d7734b48d9
x-ms-traffictypediagnostic: DM5PR18MB1052:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB10526052AEC549909C7B56DDFC440@DM5PR18MB1052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(51234002)(199004)(189003)(66556008)(3846002)(66066001)(256004)(81166006)(81156014)(6506007)(8936002)(8676002)(386003)(6486002)(50226002)(86362001)(44832011)(446003)(71190400001)(5660300002)(186003)(26005)(478600001)(4326008)(52116002)(76176011)(64756008)(6116002)(6512007)(6436002)(2616005)(66476007)(7736002)(11346002)(14454004)(110136005)(316002)(102836004)(66946007)(25786009)(54906003)(71200400001)(99286004)(36756003)(2906002)(305945005)(1076003)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1052;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 60e39+vOdOuJ+NDdvwLStnL+iXdZ4TBQh4Ht1K47m0FVL8qbD0HlGzKhGutFrgIg5r0wcZZdPHRcrUbmNqzIfOtX13L9eB1uA/8KjuPiaCykG//CtDwhZKkLeYEZBZTjbOcES9AQXOsoCqR5rqd/rMY96Shcd7NRbNpqADJyOYJDHGvuzUo1s1ETr6vW3OvLd8W5/zT0FR/Tic672Zt639TvZ6WVyKXjPsTJYxI8B1FndnMTLKAtkxi6sN3eKuyAv0GoMXlpl25YbCNBWB1Ty/6IpK1MrFa7ImPPvAGkRTEAY8rPwqKcPg2aT33Hc0/GMs28n0saFIp90CqDiZAYY735I1LFGom7bOyAqY5vLKOkNd+QMsRXrIKkPZ8MjOcTqAD1YVOk/mZncr3Ip3oLwSUU/O/mak20BoRsfNlZNW3lDhPfxWHEQ3paj4m2qYleSK2eHoQh174/pXrN4X3vsQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 810321d8-9e57-4dca-76e9-08d7734b48d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 15:05:48.0746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y87hu37QTr3JbsiFOoV1nxfN4jjxE4ykufMtmqQjZknzUM186PCy/KDkqQ+a9Mrn6JzHJ/Z6VtP/RCf4R6S1xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1052
X-OriginatorOrg: suse.com
X-MC-Unique: g3_t-a1hPYCN-5Q06O0-Ag-1
X-MC-Unique: a3DnB8PqNm6RnVIqnvCuHg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARFSpcG005032
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/5] multipathd: move set_no_path_retry() back
 to libmultipath
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This function is useful elsewhere, too. No code changes except
for changing the linkage.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 30 ++++++++++++++++++++++++++++++
 libmultipath/structs_vec.h |  1 +
 multipathd/main.c          | 30 ------------------------------
 3 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 6991f9ac..fbe97662 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -308,6 +308,36 @@ void enter_recovery_mode(struct multipath *mpp)
 		mpp->alias, mpp->no_path_retry);
 }
 
+void set_no_path_retry(struct multipath *mpp)
+{
+	char is_queueing = 0;
+
+	mpp->nr_active = pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOST);
+	if (mpp->features && strstr(mpp->features, "queue_if_no_path"))
+		is_queueing = 1;
+
+	switch (mpp->no_path_retry) {
+	case NO_PATH_RETRY_UNDEF:
+		break;
+	case NO_PATH_RETRY_FAIL:
+		if (is_queueing)
+			dm_queue_if_no_path(mpp->alias, 0);
+		break;
+	case NO_PATH_RETRY_QUEUE:
+		if (!is_queueing)
+			dm_queue_if_no_path(mpp->alias, 1);
+		break;
+	default:
+		if (mpp->nr_active > 0) {
+			mpp->retry_tick = 0;
+			if (!is_queueing)
+				dm_queue_if_no_path(mpp->alias, 1);
+		} else if (is_queueing && mpp->retry_tick == 0)
+			enter_recovery_mode(mpp);
+		break;
+	}
+}
+
 void
 sync_map_state(struct multipath *mpp)
 {
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index f8b9f63e..d3219278 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -11,6 +11,7 @@ struct vectors {
 	vector mpvec;
 };
 
+void set_no_path_retry(struct multipath *mpp);
 void enter_recovery_mode(struct multipath *mpp);
 
 int adopt_paths (vector pathvec, struct multipath * mpp);
diff --git a/multipathd/main.c b/multipathd/main.c
index bb5c1f1d..a21d96e4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -409,36 +409,6 @@ set_multipath_wwid (struct multipath * mpp)
 	dm_get_uuid(mpp->alias, mpp->wwid, WWID_SIZE);
 }
 
-static void set_no_path_retry(struct multipath *mpp)
-{
-	char is_queueing = 0;
-
-	mpp->nr_active = pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOST);
-	if (mpp->features && strstr(mpp->features, "queue_if_no_path"))
-		is_queueing = 1;
-
-	switch (mpp->no_path_retry) {
-	case NO_PATH_RETRY_UNDEF:
-		break;
-	case NO_PATH_RETRY_FAIL:
-		if (is_queueing)
-			dm_queue_if_no_path(mpp->alias, 0);
-		break;
-	case NO_PATH_RETRY_QUEUE:
-		if (!is_queueing)
-			dm_queue_if_no_path(mpp->alias, 1);
-		break;
-	default:
-		if (mpp->nr_active > 0) {
-			mpp->retry_tick = 0;
-			if (!is_queueing)
-				dm_queue_if_no_path(mpp->alias, 1);
-		} else if (is_queueing && mpp->retry_tick == 0)
-			enter_recovery_mode(mpp);
-		break;
-	}
-}
-
 int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
 		      int reset)
 {
-- 
2.24.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

