Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 005ED220945
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:52:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-Kb7ZHmX9OA6fpUoKabAEhQ-1; Wed, 15 Jul 2020 05:52:53 -0400
X-MC-Unique: Kb7ZHmX9OA6fpUoKabAEhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 766D71DEC;
	Wed, 15 Jul 2020 09:52:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5614E710DC;
	Wed, 15 Jul 2020 09:52:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1553A94F13;
	Wed, 15 Jul 2020 09:52:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qVGU007941 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07784F11CC; Wed, 15 Jul 2020 09:52:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 024AA951CB
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5092A1012448
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-T_VgOGNaPeWJFSPNXHdGzA-1; Wed, 15 Jul 2020 05:52:23 -0400
X-MC-Unique: T_VgOGNaPeWJFSPNXHdGzA-1
IronPort-SDR: Xp6i7ar3asOcYOGg6ncopGMEfiDceNVTXrAUSBq7toSzvm68C6zHBBpf1BF36/Jnxi60NDq/LA
	fnGAZskEesvi6mIN62rNyVKsFuoPLR1IV+eyZcUic9CLmEIun0lpN1h4h3L+wIVWIRFz8eychd
	nyZimBYcKONhm3r9uLqk6l/ek4kLkChG8hcPTmOjKwzkcJVA5pTmInfKBrncXngSTvJQ0w08MC
	QiEi+gfIg61Qci/NyBiNsXvygtNAvlBHsNyx4w292mnAbvrBwi1pmLk4paGB4Nh+mKv8Vv3+gk
	zgU=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769670"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:22 +0800
IronPort-SDR: hjSbtrED9ZitlzQSEylXASflSDBHw0hwzVeq5PzvPnlH49BgPLm2Py+KLHmaj4v6gZs2dC+JVL
	/gYPbzhx9ABZ4efolIMFIDOxNlqSxwS2g=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:15 -0700
IronPort-SDR: F4c+xRYoCOr/QUrw56oAsg/MdAtbfe7HjbEaOKe8hbyzYNw9993t3m5Ku0u51AjNukA+/nASt8
	IPnzg+uRVKeQ==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:22 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:14 +0900
Message-Id: <20200715095217.441885-6-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 5/8] dm verity: Fix compilation warning
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

