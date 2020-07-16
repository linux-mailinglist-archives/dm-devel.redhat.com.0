Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 66D96221B71
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 06:38:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-YoY0pKDnMe2sXHVSvXUNrg-1; Thu, 16 Jul 2020 00:38:53 -0400
X-MC-Unique: YoY0pKDnMe2sXHVSvXUNrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0308014D4;
	Thu, 16 Jul 2020 04:38:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8582572E6D;
	Thu, 16 Jul 2020 04:38:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF8811809557;
	Thu, 16 Jul 2020 04:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06G4cOWG010349 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 00:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 599C1D019F; Thu, 16 Jul 2020 04:38:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 558B5D0199
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45084101244B
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:22 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-317-OAhjpiEQOVGOWeHv_-Wo-Q-1; Thu, 16 Jul 2020 00:38:20 -0400
X-MC-Unique: OAhjpiEQOVGOWeHv_-Wo-Q-1
IronPort-SDR: ln9Ee+F/bqWjSfqcafCSedkHEkaCbZBSg4sk1GW46TBFADdxGbY7yABmfRbtPWe4negNwpE7Dz
	65PSO5E0JkimV19mlLPYSv24K4UOHG8h0h2azwTAw84r6Tp1hyfP+RTBCNdwTNY/91e8n1cAKj
	xdwjKGKEXMjtIPopzpsv7ZZ17sGW93YcpB2dJ2sljayINsv3MRgUBUysIeIMXSCLE2xQQBnxKA
	spZEUtY+vXXbSIDs87+Wp8gQ1UQW0RB6TU0cMH2PNww7f4BAFQpppw9peCajMceA1q5U5wMHGK
	XuQ=
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; d="scan'208";a="142711052"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 12:38:18 +0800
IronPort-SDR: 2W/R8cmwuoQApZn3yChxaqMNnrswEd/p0QZiE+qcvIFeA0mkY4IJng8GYK8TsVX3gvRbMLtsGS
	28wjpazmKTqJ4O3EI90y+adqqViYz7Vas=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 21:26:42 -0700
IronPort-SDR: rCJB7cBzxb5QckX2spRpXs6HIsAJrMh3vifczPc9vBG9NY5K/ZrpR10M/nhPryXeFVgsLJWguv
	51JOvLULe+aA==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 21:38:17 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 16 Jul 2020 13:38:12 +0900
Message-Id: <20200716043815.605448-2-damien.lemoal@wdc.com>
In-Reply-To: <20200716043815.605448-1-damien.lemoal@wdc.com>
References: <20200716043815.605448-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 1/4] dm verity: Fix compilation warning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For the case !CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG, declare the
functions verity_verify_root_hash(), verity_verify_is_sig_opt_arg(),
verity_verify_sig_parse_opt_args() and verity_verify_sig_opts_cleanup()
as inline to avoid a "no previous prototype for xxx" compilation
warning when compiling with W=1.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-verity-verify-sig.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-verity-verify-sig.h b/drivers/md/dm-verity-verify-sig.h
index 19b1547aa741..3987c7141f79 100644
--- a/drivers/md/dm-verity-verify-sig.h
+++ b/drivers/md/dm-verity-verify-sig.h
@@ -34,25 +34,25 @@ void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts);
 
 #define DM_VERITY_ROOT_HASH_VERIFICATION_OPTS 0
 
-int verity_verify_root_hash(const void *data, size_t data_len,
-			    const void *sig_data, size_t sig_len)
+static inline int verity_verify_root_hash(const void *data, size_t data_len,
+					  const void *sig_data, size_t sig_len)
 {
 	return 0;
 }
 
-bool verity_verify_is_sig_opt_arg(const char *arg_name)
+static inline bool verity_verify_is_sig_opt_arg(const char *arg_name)
 {
 	return false;
 }
 
-int verity_verify_sig_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
-				    struct dm_verity_sig_opts *sig_opts,
-				    unsigned int *argc, const char *arg_name)
+static inline int verity_verify_sig_parse_opt_args(struct dm_arg_set *as,
+			struct dm_verity *v, struct dm_verity_sig_opts *sig_opts,
+			unsigned int *argc, const char *arg_name)
 {
 	return -EINVAL;
 }
 
-void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts)
+static inline void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts)
 {
 }
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

