Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2C73B10B259
	for <lists+dm-devel@lfdr.de>; Wed, 27 Nov 2019 16:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574868216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bPtU4+UzW5/kvqEQITPMiEDyzt3Rcv1stOXCjALK0XQ=;
	b=hNjRLeuJXH7KQoKRBup/yQVBDh1AQJV0ZjPD6FcbLavx5VWnfxR2IVkwSuqxBin4peAKRd
	0bLwx2hCtEIeLrWn5Rs+FJhGGe/9g1LZdLxT0ORmrhXiV2GpniJR6yDl6W3JBw458LxeW9
	34urGQnPml2/EkiHRi0mj/xCKDSij4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-NhCpjT7mOwG2IuPBXDFIhQ-1; Wed, 27 Nov 2019 10:23:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA52919057A9;
	Wed, 27 Nov 2019 15:23:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52929608BF;
	Wed, 27 Nov 2019 15:23:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEF2118089C8;
	Wed, 27 Nov 2019 15:23:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARFNJHh004681 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 10:23:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D8182038B9C; Wed, 27 Nov 2019 15:23:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184EB2038B96
	for <dm-devel@redhat.com>; Wed, 27 Nov 2019 15:23:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1A0A91045D
	for <dm-devel@redhat.com>; Wed, 27 Nov 2019 15:23:18 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-293-QUBHsLUVNDqkaaNdORfNmw-1;
	Wed, 27 Nov 2019 10:23:15 -0500
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 27 Nov 2019 15:22:31 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 27 Nov 2019 15:05:56 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 27 Nov 2019 15:05:56 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1052.namprd18.prod.outlook.com (10.168.115.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.22; Wed, 27 Nov 2019 15:05:54 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::b08c:34c6:ffb6:641c]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::b08c:34c6:ffb6:641c%12]) with mapi id 15.20.2474.023;
	Wed, 27 Nov 2019 15:05:54 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH v2 5/5] libmultipath: fix ALUA autodetection when paths
	are down
Thread-Index: AQHVpTQqjSdIakixM0+rEY/99CY9rg==
Date: Wed, 27 Nov 2019 15:05:53 +0000
Message-ID: <20191127150604.31417-6-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 7fd25ec1-eea5-4e3d-6203-08d7734b4c69
x-ms-traffictypediagnostic: DM5PR18MB1052:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB105244CC7CDAC0564F80F4CFFC440@DM5PR18MB1052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:270;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(199004)(189003)(66556008)(3846002)(66066001)(256004)(14444005)(81166006)(81156014)(6506007)(8936002)(8676002)(386003)(6486002)(50226002)(86362001)(44832011)(446003)(71190400001)(5660300002)(186003)(26005)(478600001)(4326008)(52116002)(76176011)(64756008)(6116002)(6512007)(6436002)(2616005)(66476007)(7736002)(11346002)(14454004)(110136005)(316002)(102836004)(66946007)(25786009)(54906003)(71200400001)(99286004)(36756003)(2906002)(305945005)(1076003)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1052;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: blCi+qw5p2188DXKEMFh2tnyT2tN/5wJUgbznvDzxuJmpJbKmFC0YlNHnaczlkz5T1HoIFdxl/IyQEtwh40GfPaRI89kh2sMrO+O6SLlm1odaPK6XYCktQx6UitO5QRz4CNcEE1Ky/JoYl5nGlDhmfC4HsHFGGBzCvh4Vl0jEOjWT786S1BQ3886Wnzs8zcYE8fc8fNC/Ws5VDq852sNZFTH1C3JTZhnZ75DHZmMY0aVlL1e2957Xup4ppoypm5yg23E7wlO7C5u2VyZ+hGfuX/fSOvhvz+4+Jz+W1dUsOtv6bP2lbw9Hz+88fiA5i4BxOAzG40MMh6iE1N3GrZ7SlyGzwM7PDit59QXA84/4IH850hI1mtG834FeCQ70Sy8g7z9MAAajQY4Ff7IGwvb4Jmf2a3XsumdGCtXOvJiJhWuZeiPRps6wvDEoR5wbnZ7
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd25ec1-eea5-4e3d-6203-08d7734b4c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 15:05:53.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcrWTmmdCIxV9BvbXgezt700X46EciDZ/3eGSbb4sIAyuodtiq+bAPLZnJw9SCjqBBa7S3NSxZP93qn04lEujw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1052
X-OriginatorOrg: suse.com
X-MC-Unique: QUBHsLUVNDqkaaNdORfNmw-1
X-MC-Unique: NhCpjT7mOwG2IuPBXDFIhQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARFNJHh004681
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 5/5] libmultipath: fix ALUA autodetection when
 paths are down
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If a single path was offline when detect_alua() was called,
multipathd would assume ALUA was generally unsupported.

Fix that by assuming that if at least one path has ALUA support and
no path explicitly does not have it, ALUA is supported.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

---
 libmultipath/discovery.c | 22 +++++++++++++++++++++-
 libmultipath/propsel.c   | 20 +++++++++++++++++---
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 4288c9fd..5f41dcb7 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -871,6 +871,10 @@ get_serial (char * str, int maxlen, int fd)
 	return 1;
 }
 
+/*
+ * Side effect: sets pp->tpgs if it could be determined.
+ * If ALUA calls fail because paths are unreachable, pp->tpgs remains unchanged.
+ */
 static void
 detect_alua(struct path * pp)
 {
@@ -881,12 +885,28 @@ detect_alua(struct path * pp)
 	if (sysfs_get_timeout(pp, &timeout) <= 0)
 		timeout = DEF_TIMEOUT;
 
-	if ((tpgs = get_target_port_group_support(pp, timeout)) <= 0) {
+	tpgs = get_target_port_group_support(pp, timeout);
+	if (tpgs == -RTPG_INQUIRY_FAILED)
+		return;
+	else if (tpgs <= 0) {
 		pp->tpgs = TPGS_NONE;
 		return;
 	}
+
+	if (pp->fd == -1 || pp->offline)
+		return;
+
 	ret = get_target_port_group(pp, timeout);
 	if (ret < 0 || get_asymmetric_access_state(pp, ret, timeout) < 0) {
+		int state;
+
+		if (ret == -RTPG_INQUIRY_FAILED)
+			return;
+
+		state = path_offline(pp);
+		if (state == PATH_DOWN || state == PATH_PENDING)
+			return;
+
 		pp->tpgs = TPGS_NONE;
 		return;
 	}
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 27e8d68a..a5fc6ba0 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -432,12 +432,26 @@ int select_hwhandler(struct config *conf, struct multipath *mp)
 	static const char tpgs_origin[]= "(setting: autodetected from TPGS)";
 	char *dh_state;
 	int i;
-	bool all_tpgs = true;
+	bool all_tpgs = true, one_tpgs = false;
 
 	dh_state = &handler[2];
 
-	vector_foreach_slot(mp->paths, pp, i)
-		all_tpgs = all_tpgs && (path_get_tpgs(pp) > 0);
+	/*
+	 * TPGS_UNDEF means that ALUA support couldn't determined either way
+	 * yet, probably because the path was always down.
+	 * If at least one path does have TPGS support, and no path has
+	 * TPGS_NONE, assume that TPGS would be supported by all paths if
+	 * all were up.
+	 */
+	vector_foreach_slot(mp->paths, pp, i) {
+		int tpgs = path_get_tpgs(pp);
+
+		all_tpgs = all_tpgs && tpgs != TPGS_NONE;
+		one_tpgs = one_tpgs ||
+			(tpgs != TPGS_NONE && tpgs != TPGS_UNDEF);
+	}
+	all_tpgs = all_tpgs && one_tpgs;
+
 	if (mp->retain_hwhandler != RETAIN_HWHANDLER_OFF) {
 		vector_foreach_slot(mp->paths, pp, i) {
 			if (get_dh_state(pp, dh_state, sizeof(handler) - 2) > 0
-- 
2.24.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

