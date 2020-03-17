Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CB87A1886FC
	for <lists+dm-devel@lfdr.de>; Tue, 17 Mar 2020 15:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584454311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eoYpTphSYfM807olVGn4uCM0OP6jJ3uX13ed3rEzr/M=;
	b=FPb1JHm8OxXsWJA12zqjxELLMJU/9p45Ld55emaHj1uwYNIudOyD3RvYmLdzLkN46DR+pP
	/JyFlsdqT7N2ERqQ9wt8C7M+Y+97icpzbBVLOWlqXRoIcJfXfH1dvH0lNLLHU/V0eWyzXm
	6S2HVkG1ABTe6YvCQcaFZ3ZWetSMd/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-07TGXoI-POaqmHsQCLAcng-1; Tue, 17 Mar 2020 10:11:49 -0400
X-MC-Unique: 07TGXoI-POaqmHsQCLAcng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B99800D50;
	Tue, 17 Mar 2020 14:11:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0EFB60C84;
	Tue, 17 Mar 2020 14:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9BA486FF9;
	Tue, 17 Mar 2020 14:11:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02H9i31X023584 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 05:44:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46D632063FE5; Tue, 17 Mar 2020 09:44:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 410782063FE8
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 09:44:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28450185A795
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 09:44:01 +0000 (UTC)
Received: from JPTOSEGREL01.sonyericsson.com (jptosegrel01.sonyericsson.com
	[124.215.201.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346-Ga5sPc3XM3mjvbw_RZRf9g-1; Tue, 17 Mar 2020 05:43:58 -0400
X-MC-Unique: Ga5sPc3XM3mjvbw_RZRf9g-1
From: "Shetty, Harshini X (EXT-Sony Mobile)" <Harshini.X.Shetty@sony.com>
To: "agk@redhat.com" <agk@redhat.com>, "snitzer@redhat.com"
	<snitzer@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [PATCH] dm verity fec: Fix memory leak in verity_fec_ctr
Thread-Index: AQHV/DyjrQCWUvMZVUa3BDPG/mY8LA==
Date: Tue, 17 Mar 2020 09:15:45 +0000
Message-ID: <20200317091212.GA18241@harshini.x.shetty@sony.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.129.18.4]
Content-ID: <01CFC96C73429D4ABFE942242D1CB26E@sonymobile.com>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=eaRDgIMH c=1 sm=1 tr=0
	a=CGteIMthFL3x4Fb36c5kWA==:117 a=xqWC_Br6kY4A:10
	a=kZ-Mre0lY6gA:10 a=kj9zAlcOel0A:10 a=SS2py6AdgQ4A:10
	a=z6gsHLkEAAAA:8 a=wBHjdp_E2R-oqTygC78A:9 a=CjuIK1q_8ugA:10
	a=d-OLMTCWyvARjPbQ-enb:22
X-SEG-SpamProfiler-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02H9i31X023584
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 17 Mar 2020 10:11:05 -0400
Cc: "Takeuchi, Shingo \(SOMC\)" <Shingo.Takeuchi@sony.com>, "Khasnis,
	Soumya X \(EXT-Sony Mobile\)" <Soumya.Khasnis@sony.com>,
	"Nagaraju, Srinavasa \(SOMC\)" <Srinavasa.Nagaraju@sony.com>,
	"Takahashi, Masaya \(SOMC\)" <Masaya.Takahashi@sony.com>, "Shetty,
	Harshini X \(EXT-Sony Mobile\)" <Harshini.X.Shetty@sony.com>
Subject: [dm-devel] [PATCH] dm verity fec: Fix memory leak in verity_fec_ctr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix below kmemleak detected in verity_fec_ctr.
output_pool is allocated for each dm-target device.
But it is not freed when dm-table for the target
is removed.Hence Free the output buffer in destructor
function verity_fec_dtr

unreferenced object 0xffffffffa574d000 (size 4096):
  comm "init", pid 1667, jiffies 4294894890 (age 307.168s)
  hex dump (first 32 bytes):
    8e 36 00 98 66 a8 0b 9b 00 00 00 00 00 00 00 00  .6..f...........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000060e82407>] __kmalloc+0x2b4/0x340
    [<00000000dd99488f>] mempool_kmalloc+0x18/0x20
    [<000000002560172b>] mempool_init_node+0x98/0x118
    [<000000006c3574d2>] mempool_init+0x14/0x20
    [<0000000008cb266e>] verity_fec_ctr+0x388/0x3b0
    [<000000000887261b>] verity_ctr+0x87c/0x8d0
    [<000000002b1e1c62>] dm_table_add_target+0x174/0x348
    [<000000002ad89eda>] table_load+0xe4/0x328
    [<000000001f06f5e9>] dm_ctl_ioctl+0x3b4/0x5a0
    [<00000000bee5fbb7>] do_vfs_ioctl+0x5dc/0x928
    [<00000000b475b8f5>] __arm64_sys_ioctl+0x70/0x98
    [<000000005361e2e8>] el0_svc_common+0xa0/0x158
    [<000000001374818f>] el0_svc_handler+0x6c/0x88
    [<000000003364e9f4>] el0_svc+0x8/0xc
    [<000000009d84cec9>] 0xffffffffffffffff

Signed-off-by: Harshini Shetty <harshini.x.shetty@sony.com>
---
 drivers/md/dm-verity-fec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
index 3ceeb6b..49147e6 100644
--- a/drivers/md/dm-verity-fec.c
+++ b/drivers/md/dm-verity-fec.c
@@ -551,6 +551,7 @@ void verity_fec_dtr(struct dm_verity *v)
 	mempool_exit(&f->rs_pool);
 	mempool_exit(&f->prealloc_pool);
 	mempool_exit(&f->extra_pool);
+	mempool_exit(&f->output_pool);
 	kmem_cache_destroy(f->cache);
 
 	if (f->data_bufio)
-- 
1.9.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

