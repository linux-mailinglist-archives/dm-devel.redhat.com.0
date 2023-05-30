Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC05A716F2E
	for <lists+dm-devel@lfdr.de>; Tue, 30 May 2023 22:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685480089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tvDh0+LZsUw9L95IfaW2ZTLEVae844nUzZqqlBoxb2c=;
	b=Mp8uXQaFEuGiZLKzpXK/JykZ3xva+9mgacPz5qo1QFAmihNbUN08OR8t3umLRkusRuPybt
	JvcsL1IW7GVZKSdxtX1lhhv3xe1U1u2AaFAh57/DvWYevgPqne5Gil3OUJX/W9MQNnnRVp
	dG6tD1fqFJlDfXA9JiaGMQmYQE1xGtg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-ERDwWTMiPdK3Z7Sz44mUSA-1; Tue, 30 May 2023 16:54:47 -0400
X-MC-Unique: ERDwWTMiPdK3Z7Sz44mUSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 457601C0784C;
	Tue, 30 May 2023 20:54:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 248552166B26;
	Tue, 30 May 2023 20:54:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C3D7C194F249;
	Tue, 30 May 2023 20:54:26 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F6CF1946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 30 May 2023 20:40:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E368AC154D3; Tue, 30 May 2023 20:40:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBDF3C154D1
 for <dm-devel@redhat.com>; Tue, 30 May 2023 20:40:56 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C20EC1C08DCC
 for <dm-devel@redhat.com>; Tue, 30 May 2023 20:40:56 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com
 (wout5-smtp.messagingengine.com [64.147.123.21]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-cqhDjk59OS2qX9zOK_ob8w-1; Tue, 30 May 2023 16:40:55 -0400
X-MC-Unique: cqhDjk59OS2qX9zOK_ob8w-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E111C3200564;
 Tue, 30 May 2023 16:31:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 30 May 2023 16:31:37 -0400
X-ME-Sender: <xms:KF12ZIcWTu9BgYWVnhEkNCgyldRjiIIivqliwszOsduSmFm4IdqoPQ>
 <xme:KF12ZKP95io6VvF4anqN-RsGY3JIHPM2H_NNrf4hAiPKulV0tnnZybCWntLhxeqO4
 -Lik-Rhg1tlrDQ>
X-ME-Received: <xmr:KF12ZJjI3u9l3-RJvdt8Vo8A2EOjQ1fCbipCpT13Yne0YnV48t4V2u40avU4A8Q9pgTwxkx9Nw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
 ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
 hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhm
X-ME-Proxy: <xmx:KF12ZN9kF0sGBlydds97tAta0NfieJK6SAd2g6wQaosp7uuxUJxIOg>
 <xmx:KF12ZEsRbplVPcJ71hKhLybUZMBxmbbFJybIQOln5uajLbXnbU2EaQ>
 <xmx:KF12ZEFbcbNdqbMxc5DAHolQq6sk_b8v92Q6aZJ8BV3hV8qPPuHfEQ>
 <xmx:KF12ZCAHscFGlI7DgBCVB9vwCGwd2SVURCYci4wh5OyMxMxUjfbZtA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:31:35 -0400 (EDT)
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com
Date: Tue, 30 May 2023 16:31:01 -0400
Message-Id: <20230530203116.2008-2-demi@invisiblethingslab.com>
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 30 May 2023 20:54:23 +0000
Subject: [dm-devel] [PATCH v2 01/16] device-mapper: Check that target specs
 are sufficiently aligned
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: invisiblethingslab.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Otherwise subsequent code will dereference a misaligned
`struct dm_target_spec *`, which is undefined behavior.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
---
 drivers/md/dm-ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index cc77cf3d410921432eb0c62cdede7d55b9aa674a..34fa74c6a70db8aa67aaba3f6a2fc4f38ef736bc 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1394,6 +1394,13 @@ static inline fmode_t get_mode(struct dm_ioctl *param)
 static int next_target(struct dm_target_spec *last, uint32_t next, void *end,
 		       struct dm_target_spec **spec, char **target_params)
 {
+	static_assert(_Alignof(struct dm_target_spec) <= 8,
+		      "struct dm_target_spec has excessive alignment requirements");
+	if (next % 8) {
+		DMERR("Next target spec (offset %u) is not 8-byte aligned", next);
+		return -EINVAL;
+	}
+
 	*spec = (struct dm_target_spec *) ((unsigned char *) last + next);
 	*target_params = (char *) (*spec + 1);
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

