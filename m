Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 82D8113230A
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 10:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578390947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WpqqXFQWZrzLjxcqOUVZrI/LF0aYzOsvMXvpaPMfI/U=;
	b=XfdMWN4MODz+4ZBDTeZA8hc3bFUu166vkPem0jvGSIwgaChuuflo7DTPNdvkj0DNLc6C8M
	MEZrSaHEBMVDd/GrWviQilZA6J3q6M7FX/Va3/7uFONFjHtDbZor3+m46634h5vRx0nWZM
	JMXOXyXMs2UzaPuu7QnRbXwDapVEhlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-7cbWsagQOdOu0HojnN2ktg-1; Tue, 07 Jan 2020 04:55:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 308F5801E7E;
	Tue,  7 Jan 2020 09:55:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 979BE7C34A;
	Tue,  7 Jan 2020 09:55:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8DB5381C67;
	Tue,  7 Jan 2020 09:55:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0076wR4m004779 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 01:58:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8939F115157; Tue,  7 Jan 2020 06:58:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C80115150
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 06:58:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75EC285A33F
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 06:58:24 +0000 (UTC)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
	(mail-eopbgr1300041.outbound.protection.outlook.com [40.107.130.41])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-419-RdmSfxeOMU2XxWuAn1c24w-1; Tue, 07 Jan 2020 01:58:22 -0500
Received: from SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16) by
	HK2PR0401MB2066.apcprd04.prod.outlook.com (2603:1096:202:e::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12;
	Tue, 7 Jan 2020 06:58:18 +0000
Received: from SG2APC01FT059.eop-APC01.prod.protection.outlook.com
	(2a01:111:f400:7ebe::204) by SG2PR04CA0154.outlook.office365.com
	(2603:1096:4::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11 via
	Frontend Transport; Tue, 7 Jan 2020 06:58:18 +0000
Received: from mail.transsion.com (27.115.63.14) by
	SG2APC01FT059.mail.protection.outlook.com (10.152.251.134) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2602.11 via Frontend Transport; Tue, 7 Jan 2020 06:58:17 +0000
Received: from SH-EXC-MX01.transsion.com (10.150.2.41) by
	SH-EX-MX02.transsion.com (10.150.2.42) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 7 Jan 2020 14:58:04 +0800
Received: from SH-EXC-MX01.transsion.com ([fe80::a9c9:4b06:6245:846c]) by
	SH-EXC-MX01.transsion.com ([fe80::a9c9:4b06:6245:846c%13]) with mapi id
	15.01.1591.008; Tue, 7 Jan 2020 14:58:04 +0800
From: =?gb2312?B?eGlhbnJvbmcuemhvdSjW3M/IyNkp?= <xianrong.zhou@transsion.com>
To: Eric Biggers <ebiggers@kernel.org>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer
	<snitzer@redhat.com>
Thread-Topic: Reply: [PATCH v3] dm verity: don't prefetch hash blocks for
	already-verified data
Thread-Index: AdXFJ85TYSK9fZDUQLW01DuAxtba3Q==
Date: Tue, 7 Jan 2020 06:58:04 +0000
Message-ID: <6b185db43b044bd9ae96036825dee631@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.151.93]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:27.115.63.14; IPV:; CTRY:CN; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(1110001)(339900001)(199004)(189003)(186003)(81156014)(81166006)(70586007)(70206006)(478600001)(2616005)(26005)(85182001)(15650500001)(426003)(336012)(4326008)(36756003)(108616005)(24736004)(86362001)(7696005)(356004)(8936002)(8676002)(316002)(110136005)(2906002)(5660300002)(54906003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HK2PR0401MB2066;
	H:mail.transsion.com; FPR:; SPF:Fail; LANG:en;
	PTR:mail.reallytek.com; A:1; MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b88da926-55f2-4fcf-2b6b-08d7933ef953
X-MS-TrafficTypeDiagnostic: HK2PR0401MB2066:
X-Microsoft-Antispam-PRVS: <HK2PR0401MB206645C485B29D8D714EF5E3F83F0@HK2PR0401MB2066.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 027578BB13
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLukgnHA5+eoVOhmSTMsUoNEedTluiHZ4vl+3vDu+8ZidK9vnzmaLc1PV4qgMURZx+V6Q0nAh0zPf0AXDF7OIbYegPY/gGnzuwpV3+jJ+YQkblk+R/gfEIGUE6EbE4kRGWjc0Qd0fIL8QL5v74MVv4mbBrBCABmf+u2cx+w0Jr/Jfg9LVq3vBVvHrmzqOWaGEDBRbD1R9S4tMp/Qh5tdtbXaTMgl5Nyd2D4nM3/tClVWkd88/ueNIsHVrcQCcPbuMqFXuaYiK4b6E47jK8H8joaFlstc8gh1EyraZGbxYly7ko3kolqg5FIjjJOq+xIAJ4Gp3/7jX/ascWUGYiLMFsCCsBNPYS9epFIoHYdNniAWFWmQLnLfttCfUIU+d7uedHp4pkJdJbHNGIdLC9Rq3hXUX6LZzEUIvDGpFBD8octc6O119bvRHaD7nyK974Iw
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2020 06:58:17.4866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88da926-55f2-4fcf-2b6b-08d7933ef953
X-MS-Exchange-CrossTenant-Id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2; Ip=[27.115.63.14];
	Helo=[mail.transsion.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2066
X-MC-Unique: RdmSfxeOMU2XxWuAn1c24w-1
X-MC-Unique: 7cbWsagQOdOu0HojnN2ktg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0076wR4m004779
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 Jan 2020 04:55:04 -0500
Cc: =?gb2312?B?eXVhbmppb25nLmdhbyi439Sovrwp?= <yuanjiong.gao@transsion.com>,
	=?gb2312?B?cnV4aWFuLmZlbmcot+vI5ea1KQ==?= <ruxian.feng@transsion.com>,
	Patrik Torstensson <totte@google.com>, Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] Reply: [PATCH v3] dm verity: don't prefetch hash blocks
 for already-verified data
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

Hey Eric:

	Thank you very much. I am quit happy you improvement of and send this patch.

Subject: [PATCH v3] dm verity: don't prefetch hash blocks for already-verified data

From: "xianrong.zhou" <xianrong.zhou@transsion.com>

Try to skip prefetching hash blocks that won't be needed due to the "check_at_most_once" option being enabled and the corresponding data blocks already having been verified.

Since prefetching operates on a range of data blocks, do this by just trimming the two ends of the range.  This doesn't skip every unneeded hash block, since data blocks in the middle of the range could also be unneeded, and hash blocks are still prefetched in large clusters as controlled by dm_verity_prefetch_cluster.  But it can still help a lot.

In a test on Android Q launching 91 apps every 15s repeated 21 times, prefetching was only done for 447177/4776629 = 9.36% of data blocks.

Tested-by: ruxian.feng <ruxian.feng@transsion.com>
Co-developed-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
Signed-off-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
Signed-off-by: xianrong.zhou <xianrong.zhou@transsion.com>
[EB: simplified the 'while' loops and improved the commit message]
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/md/dm-verity-target.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c index 4fb33e7562c5..0d61e9c67986 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -611,8 +611,22 @@ static void verity_prefetch_io(struct work_struct *work)
 
 static void verity_submit_prefetch(struct dm_verity *v, struct dm_verity_io *io)  {
+	sector_t block = io->block;
+	unsigned int n_blocks = io->n_blocks;
 	struct dm_verity_prefetch_work *pw;
 
+	if (v->validated_blocks) {
+		while (n_blocks && test_bit(block, v->validated_blocks)) {
+			block++;
+			n_blocks--;
+		}
+		while (n_blocks && test_bit(block + n_blocks - 1,
+					    v->validated_blocks))
+			n_blocks--;
+		if (!n_blocks)
+			return;
+	}
+
 	pw = kmalloc(sizeof(struct dm_verity_prefetch_work),
 		GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
 
@@ -621,8 +635,8 @@ static void verity_submit_prefetch(struct dm_verity *v, struct dm_verity_io *io)
 
 	INIT_WORK(&pw->work, verity_prefetch_io);
 	pw->v = v;
-	pw->block = io->block;
-	pw->n_blocks = io->n_blocks;
+	pw->block = block;
+	pw->n_blocks = n_blocks;
 	queue_work(v->verify_wq, &pw->work);
 }
 
--
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

