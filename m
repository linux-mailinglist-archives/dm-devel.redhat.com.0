Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 069A0103B5D
	for <lists+dm-devel@lfdr.de>; Wed, 20 Nov 2019 14:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574256441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rou60RXL3grGwK5Ck5CMlN0E+QP4ndUgpvp7f64r2Pc=;
	b=hh+aYYHrYUDSv7RTsTvR6jlJFT5jfjvCvPmAMploYAaxh+ekVk8iNT7MI+Yt3LOG99iAG7
	/1dVVfc6S8GFg/dG8BSfs76oPRZdIyZzatGOVXSBqA52Uf4mpKOnQzESUC8ZGoVWlJTJyb
	byWq6b6+wqNPtoaIvH9lv/qNPObN2PE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-NYg6o8TBOnalcU7a_Vja_Q-1; Wed, 20 Nov 2019 08:27:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A214800054;
	Wed, 20 Nov 2019 13:27:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D474F5194E;
	Wed, 20 Nov 2019 13:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D11151819ACE;
	Wed, 20 Nov 2019 13:27:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKDQsDD001664 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 08:26:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFD6920316DF; Wed, 20 Nov 2019 13:26:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5082064002
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 13:26:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65BB2801035
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 13:26:52 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-173-s6cBcseUO0SGn0AONxdNAQ-1;
	Wed, 20 Nov 2019 08:26:49 -0500
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 20 Nov 2019 13:25:48 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 20 Nov 2019 12:55:02 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 20 Nov 2019 12:55:02 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB0955.namprd18.prod.outlook.com (10.168.117.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.29; Wed, 20 Nov 2019 12:55:01 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150%5]) with mapi id 15.20.2451.031;
	Wed, 20 Nov 2019 12:55:01 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH v2 1/5] multipathd: move set_no_path_retry() back to
	libmultipath
Thread-Index: AQHVn6G4ewR9QtlPI0KWPSywTuzsag==
Date: Wed, 20 Nov 2019 12:55:01 +0000
Message-ID: <20191120125437.19372-2-martin.wilck@suse.com>
References: <20191120125437.19372-1-martin.wilck@suse.com>
In-Reply-To: <20191120125437.19372-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0147.eurprd07.prod.outlook.com
	(2603:10a6:207:8::33) To DM5PR18MB1355.namprd18.prod.outlook.com
	(2603:10b6:3:14a::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9303dabd-b74e-4ce2-204d-08d76db8db18
x-ms-traffictypediagnostic: DM5PR18MB0955:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB09553FDA06FD62F3AE98BD4FFC4F0@DM5PR18MB0955.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(51234002)(199004)(189003)(66946007)(81156014)(36756003)(8936002)(66476007)(71200400001)(52116002)(316002)(6486002)(6436002)(102836004)(8676002)(81166006)(66556008)(110136005)(71190400001)(54906003)(25786009)(478600001)(1076003)(4326008)(305945005)(50226002)(14454004)(6506007)(66446008)(64756008)(386003)(5660300002)(486006)(7736002)(2906002)(256004)(186003)(26005)(44832011)(3846002)(6116002)(446003)(11346002)(99286004)(76176011)(2616005)(476003)(86362001)(66066001)(6512007)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB0955;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oLY0dYWqWN65mmus/ibRsGxJLRnbTxhpJJjYJA84IKYuo4nhSdHDUCO5yLbCiODXEolRs6tzFfcB5jTcU7kk+sWl8UuAPxkegoBxVBoL2h3fVbq+LKZQWmQEI/mCfnDumMPTUBdy68KSsgZQOqcxqnHwuzrcu5Q60SEY+N78TRCRxMeXNVFPsPuHMOm1JTr1uhbwzwN2lMQA/fTkwOSp0O2SdF5jfckZCB77Ije8GWHZnFP+1dK9zDRQ9R0pcSYmqvr7hgIo6MFWAhlQbsgbu68FiY023ENuedsplxQjHx2J9aJGeWU2ew9K0CBzrp0vGcrYIsYXb7aIF+U/DYjdoEi1q21qsngoUilB2FoPEYqdK333qxzDoNFz6fusDmXVRIsWdzY7anqOiqFgZlTRysMy/8UIYEXeZpCb4TE+5CJ3rGk00Xncy0dLOkOFqzk3zknOzdQM3t4Dyq5bpM5akg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9303dabd-b74e-4ce2-204d-08d76db8db18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 12:55:01.5235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tfQIWx6zK6YX9sKQOtbnoKu8c3BJ0wFeGQASHbayMNLtYTr3XbI74a8IA4BtCxWLcJzZQ6ZJP5kmM3ybGn+hFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB0955
X-OriginatorOrg: suse.com
X-MC-Unique: s6cBcseUO0SGn0AONxdNAQ-1
X-MC-Unique: NYg6o8TBOnalcU7a_Vja_Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAKDQsDD001664
X-loop: dm-devel@redhat.com
Cc: Bart Van Assche <Bart.VanAssche@sandisk.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>, Chongyun Wu <wu.chongyun@h3c.com>
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
Content-Transfer-Encoding: quoted-printable

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
 =09=09mpp->alias, mpp->no_path_retry);
 }
=20
+void set_no_path_retry(struct multipath *mpp)
+{
+=09char is_queueing =3D 0;
+
+=09mpp->nr_active =3D pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOST)=
;
+=09if (mpp->features && strstr(mpp->features, "queue_if_no_path"))
+=09=09is_queueing =3D 1;
+
+=09switch (mpp->no_path_retry) {
+=09case NO_PATH_RETRY_UNDEF:
+=09=09break;
+=09case NO_PATH_RETRY_FAIL:
+=09=09if (is_queueing)
+=09=09=09dm_queue_if_no_path(mpp->alias, 0);
+=09=09break;
+=09case NO_PATH_RETRY_QUEUE:
+=09=09if (!is_queueing)
+=09=09=09dm_queue_if_no_path(mpp->alias, 1);
+=09=09break;
+=09default:
+=09=09if (mpp->nr_active > 0) {
+=09=09=09mpp->retry_tick =3D 0;
+=09=09=09if (!is_queueing)
+=09=09=09=09dm_queue_if_no_path(mpp->alias, 1);
+=09=09} else if (is_queueing && mpp->retry_tick =3D=3D 0)
+=09=09=09enter_recovery_mode(mpp);
+=09=09break;
+=09}
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
 =09vector mpvec;
 };
=20
+void set_no_path_retry(struct multipath *mpp);
 void enter_recovery_mode(struct multipath *mpp);
=20
 int adopt_paths (vector pathvec, struct multipath * mpp);
diff --git a/multipathd/main.c b/multipathd/main.c
index bb5c1f1d..a21d96e4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -409,36 +409,6 @@ set_multipath_wwid (struct multipath * mpp)
 =09dm_get_uuid(mpp->alias, mpp->wwid, WWID_SIZE);
 }
=20
-static void set_no_path_retry(struct multipath *mpp)
-{
-=09char is_queueing =3D 0;
-
-=09mpp->nr_active =3D pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOST)=
;
-=09if (mpp->features && strstr(mpp->features, "queue_if_no_path"))
-=09=09is_queueing =3D 1;
-
-=09switch (mpp->no_path_retry) {
-=09case NO_PATH_RETRY_UNDEF:
-=09=09break;
-=09case NO_PATH_RETRY_FAIL:
-=09=09if (is_queueing)
-=09=09=09dm_queue_if_no_path(mpp->alias, 0);
-=09=09break;
-=09case NO_PATH_RETRY_QUEUE:
-=09=09if (!is_queueing)
-=09=09=09dm_queue_if_no_path(mpp->alias, 1);
-=09=09break;
-=09default:
-=09=09if (mpp->nr_active > 0) {
-=09=09=09mpp->retry_tick =3D 0;
-=09=09=09if (!is_queueing)
-=09=09=09=09dm_queue_if_no_path(mpp->alias, 1);
-=09=09} else if (is_queueing && mpp->retry_tick =3D=3D 0)
-=09=09=09enter_recovery_mode(mpp);
-=09=09break;
-=09}
-}
-
 int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
 =09=09      int reset)
 {
--=20
2.24.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

