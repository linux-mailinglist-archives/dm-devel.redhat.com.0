Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E84DD10B249
	for <lists+dm-devel@lfdr.de>; Wed, 27 Nov 2019 16:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574867957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=egv/2dzHfhe0vDgp5Mq4FrzMB7d0dfvzavNDt01EJZo=;
	b=dXpBow3t+BDaZyOeT8WnYTw9nTgBxmZqISpaITGhowOojRgTymyHmqNM1zO4sk8lHBX7Gf
	U68b0/OEZgP+yp/6gw/QVy4TarRGJknb4Y6PLD8T7yYhMdqoQnKU+OdRKL3Z/tT+3tg4iz
	X+N4t9Q4kJgAMFYIORq/LFHe75s8MV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-vOSSuGH2PFalnoaRaMsb6Q-1; Wed, 27 Nov 2019 10:19:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5341218037F6;
	Wed, 27 Nov 2019 15:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC4DC5D9D6;
	Wed, 27 Nov 2019 15:19:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB7304BB65;
	Wed, 27 Nov 2019 15:18:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARFIhBk004486 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 10:18:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E97AE2038B9D; Wed, 27 Nov 2019 15:18:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E45C02038B96
	for <dm-devel@redhat.com>; Wed, 27 Nov 2019 15:18:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF6208F8A78
	for <dm-devel@redhat.com>; Wed, 27 Nov 2019 15:18:40 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-143-2s7eXImrPsOgBAsU4SLgTQ-1;
	Wed, 27 Nov 2019 10:18:38 -0500
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 27 Nov 2019 15:15:52 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 27 Nov 2019 15:05:47 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 27 Nov 2019 15:05:47 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1052.namprd18.prod.outlook.com (10.168.115.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.22; Wed, 27 Nov 2019 15:05:46 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::b08c:34c6:ffb6:641c]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::b08c:34c6:ffb6:641c%12]) with mapi id 15.20.2474.023;
	Wed, 27 Nov 2019 15:05:46 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH v2 RESEND 0/5]  Drop nr_active, and some more fixes
Thread-Index: AQHVpTQls+TiEdebPEa7pSyROD6N+w==
Date: Wed, 27 Nov 2019 15:05:46 +0000
Message-ID: <20191127150604.31417-1-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: ad692723-033f-4670-4840-08d7734b47d3
x-ms-traffictypediagnostic: DM5PR18MB1052:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB105264625F6A5148AA16BDDDFC440@DM5PR18MB1052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(199004)(189003)(66556008)(3846002)(66066001)(256004)(14444005)(81166006)(81156014)(6506007)(8936002)(8676002)(386003)(6486002)(50226002)(86362001)(44832011)(71190400001)(5660300002)(186003)(26005)(478600001)(4326008)(52116002)(64756008)(6116002)(6512007)(6436002)(2616005)(66476007)(7736002)(14454004)(110136005)(316002)(102836004)(66946007)(25786009)(54906003)(71200400001)(99286004)(36756003)(2906002)(305945005)(1076003)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1052;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: INclqesNsecvAJz/7Lv7MGvnD8LoirqHibz6UMIR2MfgZctKtzjCCyFaipJil1qa3lq3v39z6tf/qYkUR5mFk/+RtdHqw6j2ED1f/qVXAuOaMjVc8lNG5unWvig4XG9puZOQ93pFH/X8wYc0aCWTy1gBkr+E/Z0fKvrjUujennrKG8qVwYxwCY4f1uCK+yPvd/Xi5v8d63j8MHogGuXJXxm2UQMQkB/9pguZfgzZDTHw412HqOOHs3+xfvWKQbaPZ913NMpnmsMn1BX3mnUd1jux8gfjV90Gw3JQjnuuT1sY/z3cRKFOdrUTT6Tp2y9ZLiWEwFXe6ms0+4C4AmktbEnD1Oxrssm8cnu9R46mxsFd6isxbsD1o8RQUMzJGozc68XV1zqels6GbNnUOKflVUYiQKfQ82LTl8w+oi898rDSZfPZAjHSNjfqv2W9TaOL
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad692723-033f-4670-4840-08d7734b47d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 15:05:46.3653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgdS6d499Tj9D4l99gLmEB92Xtp3rV0SVpM56zPGnqGfDhLitpYER7Yhc+v4hT9b1rufMZlyqzts2EpR4PYWyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1052
X-OriginatorOrg: suse.com
X-MC-Unique: 2s7eXImrPsOgBAsU4SLgTQ-1
X-MC-Unique: vOSSuGH2PFalnoaRaMsb6Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARFIhBk004486
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 RESEND 0/5]  Drop nr_active,
	and some more fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

(Resending this, as it didn't make it to the ML last time).

This series applies on top of my late "multipath-tools: cleanup and 
warning enablement" series.

Patch 3/5 is a rework of my RFC patch with the same subject
submitted on Nov. 13th, trying to accomodate Ben's suggestions.
Patch 1 and 2 are trivial refactorings to prepare for it.
Patch 4 and 5 are fixes for bugs that I encountered when
testing patch 3.

As usual, reviews and comments are welcome.

Changes v1 -> v2:

 * Added Reviewed-by's from Ben where appropriate
 * 03/05: don't check current state when calling set_no_path_retry()
   from cli_handler code (Ben)

Martin Wilck (5):
  multipathd: move set_no_path_retry() back to libmultipath
  libmultipath: dict.c: rename duplicate set_no_path_retry()
  libmultipath: drop mpp->nr_active field
  libmultipath: fix (max_)polling_interval setting logic
  libmultipath: fix ALUA autodetection when paths are down

 libmultipath/config.c      | 40 +++++++++++++++--
 libmultipath/config.h      |  1 +
 libmultipath/configure.c   |  5 +--
 libmultipath/defaults.h    |  3 +-
 libmultipath/devmapper.c   |  2 +-
 libmultipath/dict.c        | 10 ++---
 libmultipath/discovery.c   | 22 +++++++++-
 libmultipath/io_err_stat.c |  4 +-
 libmultipath/print.c       |  5 ++-
 libmultipath/propsel.c     | 20 +++++++--
 libmultipath/structs.c     | 19 ++++++++
 libmultipath/structs.h     |  4 +-
 libmultipath/structs_vec.c | 89 +++++++++++++++++++++++++++++++-------
 libmultipath/structs_vec.h |  3 +-
 multipathd/cli_handlers.c  | 41 ++++++++----------
 multipathd/main.c          | 75 +++++---------------------------
 16 files changed, 217 insertions(+), 126 deletions(-)

-- 
2.24.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

